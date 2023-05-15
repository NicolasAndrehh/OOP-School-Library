require_relative 'person'

class Teacher < Person
  # Constuctor
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  # Methods
  def can_use_services?
    true
  end
end
