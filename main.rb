require_relative 'person'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, 'maximilianus')

p person.correct_name # => "maximilianus"
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name # => "Maximilianus"
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name # => "Maximilian"

classroom_a = Classroom.new('A')
classroom_b = Classroom.new('B')

student = Student.new(16, classroom_a, 'maximilianus')
book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
p classroom_a.students
p student.classroom
p student.add_classroom('B')
p classroom_b.students

rental = Rental.new(Time.now, person, book)
p rental
