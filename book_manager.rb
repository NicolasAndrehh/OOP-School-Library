require_relative './models/book'
require_relative 'base_manager'

class BookManager < BaseManager
  attr_accessor :books

  def initialize
    super
    @books = []
  end

  # List all books
  def list_all_books
    check_empty_list(@books, 'books')

    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  # Create a book
  def create_book
    title, author = book_data

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def book_data
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end
end
