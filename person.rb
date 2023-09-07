require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimmer'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :type, :id
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

  private

  def of_age?
    @age.to_i >= 18
  end

  public

  def can_use_servicies?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end
end
