require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Ruby on Rails', 'Teacher', 32, 'FK') }

  describe '#initialize' do
    it 'creates a new Teacher instance' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'initializes a Teacher object with specialization' do
      expect(teacher.specialization).to eq('Ruby on Rails')
    end

    it 'initializes a Teacher object with default values' do
      expect(teacher.type).to eq('Teacher')
      expect(teacher.age).to eq(32)
      expect(teacher.name).to eq('FK')
    end
  end

  describe '#can_use_servicies?' do
    it 'returns true' do
      expect(teacher.can_use_servicies?).to be(true)
    end
  end

  describe '#hash_structure' do
    it 'returns a hash of the instanced teacher attributes' do
      expected_hash = {
        specialization: 'Ruby on Rails',
        type: 'Teacher',
        age: 32,
        name: 'FK'
      }
      expect(teacher.hash_structure).to eq(expected_hash)
    end
  end
end
