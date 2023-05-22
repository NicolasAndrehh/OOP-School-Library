require_relative 'people_manager'
require_relative 'book_manager'
require_relative 'rental_manager'
require_relative 'menu_manager'

class App
  def initialize
    @people_manager = PeopleManager.new
    @books_manager = BookManager.new
    @rentals_manager = RentalManager.new
    @menu = Menu.new(self)
  end

  def start
    @menu.display_menu
  end

  # Methods for people management
  def list_all_people
    @people_manager.list_all_people
    start
  end

  def create_person
    @people_manager.create_person
    start
  end

  # Methods for book management
  def list_all_books
    @books_manager.list_all_books
    start
  end

  def create_book
    @books_manager.create_book
    start
  end

  # Methods for rental management
  def create_rental
    @rentals_manager.create_rental(@people_manager, @books_manager)
    start
  end

  def list_rentals_by_person_id
    @rentals_manager.list_rentals_by_person_id
    start
  end
end