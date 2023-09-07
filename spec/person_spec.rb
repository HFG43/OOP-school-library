require_relative '../person'
require 'json'

describe Person do
  before(:each) do
    @person_class = Person.new('Pierre', 38)
  end

  it 'Ensure the value of attribute' do
    expect(@person_class.name).to eq('Pierre')
    expect(@person_class.age).to eq 38
    expect(@person_class.parent_permission).to be true
  end

  it 'add rental' do
    @person_class.add_rental('put in table')
    expect(@person_class.rentals).to eq ['put in table']
  end

  it 'rename method' do
    @person_class.rename('franck')
    expect(@person_class.name).to_not eq 'Pierre'
  end

  it 'can i use your service method' do
    expect(@person_class.can_use_services?).to be true
  end

  it 'can i use your service method' do
    expect(@person_class.correct_name).to eq 'Pierre'
  end
end
