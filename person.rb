require_relative 'nameable'


class Person < Nameable
  attr_accessor :name, :age, :type, :id, :parent_permission
  attr_reader :rentals

  def initialize(type, age, name = 'Unknown', id = 1, parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = if id == 1
            Random.rand(1..1000)
          else
            id
          end
    @type = type
    @rentals = []
  end

  def correct_name
    @name
  end

  public

  def can_use_servicies?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
