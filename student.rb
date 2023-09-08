require_relative 'person'

class Students < Person
  attr_reader :classroom, :parent_permission

  def initialize(classroom, type, age, name = 'Unknown', id = 1, parent_permission: true)
    super(type, age, name, id, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
     '¯\(ツ)/¯'
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def hash_structure
    {
      classroom: @classroom,
      type: 'Student',
      age: @age,
      name: @name,
      parent_permission: @parent_permission
    }
  end
end
