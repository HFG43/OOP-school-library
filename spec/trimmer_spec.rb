require_relative '../person'
require_relative '../trimmer'

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'should return name with up to 10 characters' do
      testName = Person.new('Student', 50, 'Lordoftherings')
      decorator = TrimmerDecorator.new(testName)  
      expect(decorator.correct_name).to eq('Lordofther')
    end
  end
end
