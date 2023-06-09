require_relative '../nameable'

class Person < Nameable
  # Getters and Setters
  attr_reader :id
  attr_accessor :name, :age, :rentals

  # Constuctor
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
  end

  # Methods
  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end

  def preserve_id(id)
    @id = id
  end

  private

  def of_age?
    @age >= 18
  end
end
