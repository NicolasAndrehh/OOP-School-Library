class Classroom
  # Getters and Setters
  attr_accessor :label, :students

  # Constructor
  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
