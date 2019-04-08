RSpec.describe Web::Controllers::Books::Create, type: :action do
  let(:interactor) { instance_double('AddBook', call: nil) }
  let(:action) { described_class.new(interactor: interactor) }

  context 'with valid params' do
    let(:params) { Hash[book: { title: 'We Are Seven', author: 'William Wordsworth' }] }

    it 'calls interactor' do
      expect(interactor).to receive(:call)
      response = action.call(params)
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[book: {}] }

    it "does not call interactor" do
      expect(interactor).to_not receive(:call)
      response = action.call(params)
    end

    it 're-renders the books#new view' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'sets error attributes accordingly' do
      response = action.call(params)

      expect(action.params.errors[:book][:title]).to eq(['is missing'])
      expect(action.params.errors[:book][:author]).to eq(['is missing'])
    end
  end
end
