require_relative 'spec_helper'
require_relative '../rental'
require_relative '../person'
require_relative '../book'
require 'date'

describe Rental do
  let(:person) { Person.new('Student', 15, 'HFG') }
  let(:book) { Book.new('Jump', 'Van Halen') }
  let(:date) { Date.new(2024, 01, 01) }
  let(:rental) { Rental.new(date, person, book) }

  describe '#initialize' do
    it 'creates a new Rental instance' do
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'initializes a Rental object with a date' do
      expect(rental.date).to eq(date)
    end

    it 'associates the rental with a person' do
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end

    it 'associates the rental with a book' do
      expect(rental.book).to eq(book)
      expect(book.rentals).to include(rental)
    end
  end
end
