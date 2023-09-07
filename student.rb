require_relative 'person'

class Students < Person
  attr_reader :classroom

  def initialize(classroom, type, age, name = 'Unknown', parent_permission: true)
    super(type, age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def hash_structure
    {
      classroom: @classroom,
      type: "Student",
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
    }
  end  
end
