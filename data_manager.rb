require 'json'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class DataManager
  def initialize(people_manager, books_manager, rentals_manager)
    @people_manager = people_manager
    @books_manager = books_manager
    @rentals_manager = rentals_manager
  end

  def save_data
    # Get serialized data
    person_data, book_data, rental_data = serializate_data

    # Write data to files
    File.write('./data/people.json', JSON.generate(person_data))

    File.write('./data/books.json', JSON.generate(book_data))

    File.write('./data/rentals.json', JSON.generate(rental_data))
  end

  def load_data
    # Read data from files
    person_data = File.read('./data/people.json') if File.exist?('./data/people.json')

    book_data = File.read('./data/books.json') if File.exist?('./data/books.json')

    rental_data = File.read('./data/rentals.json') if File.exist?('./data/rentals.json')

    # Deserialize data
    deserialize_data(JSON.parse(check_if_nil(person_data)), JSON.parse(check_if_nil(book_data)),
                     JSON.parse(check_if_nil(rental_data)))
  end

  def serializate_data
    # Serialize people data
    people_data = @people_manager.people.map do |person|
      if person.instance_of?(Teacher)
        { id: person.id, name: person.name, age: person.age, person_type: person.class,
          specialization: person.specialization }
      else
        { id: person.id, name: person.name, age: person.age, person_type: person.class }
      end
    end

    # Serialize book data
    book_data = @books_manager.books.map do |book|
      { title: book.title, author: book.author }
    end

    # Serialize rental data
    rental_data = @rentals_manager.rentals.map do |rental|
      { date: rental.date, book_title: rental.book.title, person_id: rental.person.id, person_name: rental.person.name }
    end

    [people_data, book_data, rental_data]
  end

  def deserialize_data(people_data, book_data, rental_data)
    # Deserialize people data
    deserialized_people_data = people_data.map do |person|
      if person['person_type'] == 'Student'
        # Create student object
        student = Student.new(person['age'], nil, person['name'])
        student.preserve_id(person['id'])

        student
      else
        # Create teacher object
        teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        teacher.preserve_id(person['id'])

        teacher
      end
    end

    # Deserialize book data
    deserialized_book_data = book_data.map do |book|
      Book.new(book['title'], book['author'])
    end

    # Deserialize rental data
    deserialized_rental_data = rental_data.map do |rental|
      # Find person and book objects
      person = deserialized_people_data.find { |element| element.id == rental['person_id'] }
      book = deserialized_book_data.find { |element| element.title == rental['book_title'] }

      # Create rental object
      Rental.new(rental['date'], person, book)
    end

    [deserialized_people_data, deserialized_book_data, deserialized_rental_data]
  end

  def check_if_nil(json_string)
    json_string.nil? ? '[]' : json_string
  end
end
