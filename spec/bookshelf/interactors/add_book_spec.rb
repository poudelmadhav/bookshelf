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

    context "persistence" do
      let(:repository) { instance_double("BookRepository") }

      it "persists the book" do
        expect(repository).to receive(:create)
        AddBook.new(repository: repository).call(attributes)
      end
    end

    context "sending email" do
      let(:mailer) { instance_double("Mailers::BookAddedNotification") }

      it "send :deliver to the mailer" do
        expect(mailer).to receive(:deliver)
        AddBook.new(mailer: mailer).call(attributes)
      end
    end
  end
end
