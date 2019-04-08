RSpec.describe AddBook do
  let(:interactor) { AddBook.new }
  let(:attributes) { Hash[author: "Chetan Bhagat", title: "Revolution 2020"] }

  context "good input" do
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      result = interactor.call(attributes)
      expect(result.successful?).to be(true)
    end

    it "creates a Book with correct title and author" do
      expect(result.book.title).to eq("Revolution 2020")
      expect(result.book.author).to eq("Chetan Bhagat")
    end

    it "persists the book" do
      expect(result.book.id).to_not be_nil
    end
  end
end
