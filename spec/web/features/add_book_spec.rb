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

  it 'displays list of errors when params contaions errors' do
    visit '/books/new'

    within 'form#book-form' do
      click_button 'Create'
    end

    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('Title must be filled')
    expect(page).to have_content('Author must be filled')
  end
end