RSpec.describe Book, type: :entity do
  it 'can be initilized with attributes' do
    book = Book.new(title: 'Refactoring')
    expect(book.title).to eq('Refactoring')
  end
end
