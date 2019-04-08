require "hanami/interactor"

class AddBook
  include Hanami::Interactor

  expose :book

  def initialize
    
  end
  
  def call(book_attributes)
    @book = BookRepository.new.create(book_attributes)
  end  
end