class Classroom
  attr_accessor :label
  attr_reader :student
 
  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    @student.push(student) unless @student.include?(student)
    student.Classroom = self
  end
end
