describe ItemParser do
  subject { described_class.parse(params) }

  describe 'parse' do
    let(:params) { { externalCode: 'IT4801901403', name: 'Produto de Testes', price: 49.9, quantity: 1, total: 49.9 } }

    it 'successfully all the fields' do
      expect(subject).to eq({ external_code: 'IT4801901403', name: 'Produto de Testes', price: 49.9, quantity: 1,
                              total: 49.9 })
    end
  end
end
