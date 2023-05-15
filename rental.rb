class Rental
  # Getters and Setters
  attr_accessor :date

  # Constructor
  def initialize(date, person, book)
    @date = date

    @person = person
    person.add_rental(self)

    @book = book
    book.add_rental(self)
  end
end
