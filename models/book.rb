class Book
  # Getters and Setters
  attr_reader :title, :author, :rentals

  # Constructor
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Methods
  def add_rental(rental)
    @rentals << rental
  end
end
