require_relative 'spec_helper'
require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Back End Program') }
  let(:student) { double('student') }

  describe '#initialize' do
    it 'creates a new Classroom instance' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'initializes a Classroom object with label' do
      expect(classroom.label).to eq('Back End Program')
    end

    it 'initializes a Classroom object with an empty student array' do
      expect(classroom.student).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      expect(student).to receive(:assign_classroom).with(classroom)
      classroom.add_student(student)
      expect(classroom.student).to include(student)
    end
  end
end
