class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = "Unknown", parent_permission: true)
    @age = age
	  @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

	private

	def of_age?
		if @age.to_i >= 18
			return true
		else
			return false
		end		
	end

  public

	def can_use_servicies?
	  if of_age? && @parent_permission == true
	    puts true      
    else
      puts false  
    end
  end  	

end
