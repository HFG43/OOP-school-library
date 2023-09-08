require_relative '../student'

describe 'Student' do
  context '#initialize' do
    it 'should initialize with provided values' do
      classroom = 'Math'
      student2 = Students.new(classroom, 'Student', 16, 'Alice', 1, parent_permission: true)

      expect(student2.name).to eq('Alice')
      expect(student2.age).to eq(16)

      expect(student2.parent_permission).to be_truthy
    end
  end

  context '#play_hooky' do
    it 'should return the hooky message' do
      student = Students.new('Francais', 'Student', 10, 'Jean', 1, parent_permission: true)
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
