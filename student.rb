require_relative 'person'

class Students < Person
  attr_reader :classroom

  def initialize(classroom, age, name = "Unknown", parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end
