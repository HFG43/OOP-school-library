require_relative 'spec_helper'
require_relative '../nameable.rb'

describe Nameable do
  describe '#correct_name' do
    it 'should raise Error upon exception' do
      expect { Nameable.new.correct_name }.to raise_error('Error')
    end 
  end  
end

# end  

# class Nameable
#   def correct_name
#     raise NotImplementedError, 'Error'
#   end
# end