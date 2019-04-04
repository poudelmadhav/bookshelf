require 'features_helper'

RSpec.describe 'Add a book' do
  after do
    BookRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title', with: 'Macbeth'
      fill_in 'Author', with: 'William Shakespeare'

      click_button 'Create'
    end

    expect(page).to have_current_path('/books')
    expect(page).to have_content('New book')
  end
end