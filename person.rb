require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def correct_name
    @name
  end  

  private

  def of_age?
    @age.to_i >= 18
  end

  public

  def can_use_servicies?
    of_age? || @parent_permission
  end
end

test = Person.new(30,'Pedro')
puts test.correct_name