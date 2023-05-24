require 'json'

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
    if File.exist?('./data/people.json')
      person_data = File.read('./data/people.json')
    end

    if File.exist?('./data/books.json')
      book_data = File.read('./data/books.json')
    end

    if File.exist?('./data/rentals.json')
      rental_data = File.read('./data/rentals.json')
    end

    deserialize_data(JSON.parse(check_if_nil(person_data)), JSON.parse(check_if_nil(book_data)), JSON.parse(check_if_nil(rental_data)))
  end

  def serializate_data
    people_data = @people_manager.people.map do |person|
      if person.class == 'Teacher'
        { id: person.id, name: person.name, age: person.age, person_type: person.class, specialization: person.specialization }
      else
        { id: person.id, name: person.name, age: person.age, person_type: person.class, }
      end
    end

    book_data = @books_manager.books.map do |book|
      { title: book.title, author: book.author }
    end

    rental_data = @rentals_manager.rentals.map do |rental|
      { date: rental.date, book_title: rental.book.title, person_id: rental.person.id, person_name: rental.person.name }
    end

    [people_data, book_data, rental_data]
  end

  def deserialize_data(people_data, book_data, rental_data)
    deserialized_people_data = people_data.map do |person|
    
      if person['person_type'] == 'Student'
        Student.new(person['age'], nil, person['name'])
      else
        Teacher.new(person['age'], person['specialization'], person['name'])
      end
    end

    deserialized_book_data = book_data.map do |book|
      Book.new(book['title'], book['author'])
    end

    deserialized_rental_data = rental_data.map do |rental|
      person = deserialized_people_data.find { |element| element.name == rental['person_name'] }
      book = deserialized_book_data.find { |element| element.title == rental['book_title'] }
      Rental.new(rental['date'], person, book)
    end

    [deserialized_people_data, deserialized_book_data, deserialized_rental_data]
  end

  def check_if_nil(json_string)
    json_string.nil? ? '[]' : json_string
  end
end
