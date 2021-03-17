describe Purchase::Item do
  subject { described_class.new(payload).call }

  let(:payload) do
    {
      quantity: quantity,
      unit_price: unit_price,
      full_unit_price: full_unit_price,
      item: { id: item_id, title: item_title },
      subitems: [1, 2, 3]
    }
  end

  context 'when all the values are present' do
    let(:item_id) { 'IT4801901403' }
    let(:item_title) { 'Produto de Testes' }
    let(:quantity) { 1 }
    let(:unit_price) { 49.9 }
    let(:full_unit_price) { 49.9 }

    it 'translate them accordingly' do
      expect(subject[:externalCode]).to eq('IT4801901403')
      expect(subject[:name]).to eq('Produto de Testes')
      expect(subject[:quantity]).to eq(1)
      expect(subject[:price]).to eq(49.9)
      expect(subject[:total]).to eq(49.9)
      expect(subject[:subItems]).to eq([1, 2, 3])
    end
  end
end
