require_relative '../student'
require 'rspec'

RSpec.describe Student do
  context '#initialize' do
    it 'should initialize with default values when not provided' do
      student = Student.new
      expect(student.name).to eq('Unknown')
      expect(student.age).to be_nil
      expect(student.classroom).to be_nil
      expect(student.parent_permission).to be_truthy
    end

    it 'should initialize with provided values' do
      classroom_mock = instance_double(Classroom, label: 'Math')
      allow(classroom_mock).to receive(:add_student)
      student2 = Student.new('Alice', 16, classroom_mock, parent_permission: true)

      expect(student2.name).to eq('Alice')
      expect(student2.age).to eq(16)
      expect(student2.classroom).to eq(classroom_mock.label)
      expect(student2.parent_permission).to be_truthy
    end
  end

  context '#play_hooky' do
    it 'should return the hooky message' do
      student = Student.new
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
  end
end
