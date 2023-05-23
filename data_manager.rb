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

  def serializate_data
    people_data = @people_manager.people.map do |person|
      { id: person.id, name: person.name, age: person.age }
    end

    book_data = @books_manager.books.map do |book|
      { title: book.title, author: book.author }
    end

    rental_data = @rentals_manager.rentals.map do |rental|
      { date: rental.date, book_title: rental.book.title, person_id: rental.person.id }
    end

    [people_data, book_data, rental_data]
  end
end
