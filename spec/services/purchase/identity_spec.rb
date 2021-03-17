describe Purchase::Identity do
  subject { described_class.new(payload).call }

  context 'when all the values are present' do
    let(:payload) { { id: id, store_id: store_id } }
    let(:id) { 1234 }
    let(:store_id) { 431 }

    it 'translate them accordingly' do
      expect(subject[:externalCode]).to eq('1234')
      expect(subject[:storeId]).to eq(431)
    end
  end
end
