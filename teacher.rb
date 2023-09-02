require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, type, age, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(type, age, name, parent_permission: parent_permission)
  end

  def can_use_servicies?
    true
  end
end
