require_relative '../book'

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
end
