require_relative 'person'

class Teacher < Person
  # Getters
  attr_reader :specialization

  # Constuctor
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  # Methods
  def can_use_services?
    true
  end
end
