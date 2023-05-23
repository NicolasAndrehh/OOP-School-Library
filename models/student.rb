require_relative 'person'

class Student < Person
  attr_accessor :classroom

  # Constuctor
  def initialize(age, classroom, name = 'Unknown')
    super(age, name)
    @classroom = classroom
  end

  # Methods
  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
