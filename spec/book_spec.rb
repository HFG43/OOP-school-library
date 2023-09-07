require_relative '../book'
require 'json'

describe Book do
  before(:each) do
    @book_class = Book.new('Lord of Ring', 'John')
  end

  it 'Can test title and author attribute' do
    expect(@book_class.title).to eq('Lord of Ring')
    expect(@book_class.author).to eq('John')
  end

  it 'add rental' do
    @book_class.add_rental('put in table')
    expect(@book_class.rentals).to eq ['put in table']
  end

  it 'Json method' do
    expected_json = {
      title: 'Lord of Ring',
      author: 'John'
    }.to_json
    expect(@book_class.to_json).to eq(expected_json)
  end
end
