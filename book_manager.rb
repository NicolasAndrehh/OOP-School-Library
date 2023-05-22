require_relative 'book'

class BookManager
  attr_accessor :books

  def initialize
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
    title, author = get_book_data

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def get_book_data
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end

  # Validation method
  def check_empty_list(list, list_name)
    return unless list.empty?

    puts "There's no #{list_name} stored yet"
  end
end