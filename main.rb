require_relative 'person'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

person = Person.new(22, 'maximilianus')

p person.correct_name # => "maximilianus"
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name # => "Maximilianus"
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name # => "Maximilian"
