require_relative 'student'
require_relative 'teacher'

class PeopleManager
  attr_accessor :people

  def initialize
    @people = []
  end

  # List all people
  def list_all_people
    check_empty_list(@people, 'people')

    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Create a person (student or teacher)
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp

    case input
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please enter a valid number (1 or 2)'
      create_person
    end
  end

  # Create a student
  def create_student
    age, name = get_student_data

    @people << Student.new(age, nil, name)
    puts 'New person (Student) created successfully'
  end

  def get_student_data 
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    [age, name]
  end

  # Create a teacher
  def create_teacher
    age, name, specialization = get_teacher_data

    @people << Teacher.new(age, specialization, name)
    puts 'New person (Teacher) created successfully'
  end

  def get_teacher_data
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    [age, name, specialization]
  end

  # Validation method
  def check_empty_list(list, list_name)
    return unless list.empty?

    puts "There's no #{list_name} stored yet"
  end
end