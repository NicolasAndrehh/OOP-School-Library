require_relative 'person'

class Student < Person
    # Constuctor
    def initialize (age, classroom, name = "Unknown", parent_permission = true)
        super(age, name, parent_permission)
        @classroom = classroom
    end

    #Methods
    def play_hooky 
        '¯\(ツ)/¯'
    end
end