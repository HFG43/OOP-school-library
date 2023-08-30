class Nameable
	attr_accessor :name

	def correct_name
		raise NotImplementedError
		@name
	end	
end