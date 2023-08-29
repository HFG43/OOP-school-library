class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
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

per = Person.new(32, "xx")
puts per.can_use_servicies?
puts per.of_age?
