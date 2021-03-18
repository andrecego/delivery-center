describe ShippingAddressParser do
  subject { described_class.parse(params) }

  describe 'parse' do
    let(:params) do
      { country: 'BR', state: 'São Paulo', city: 'Cidade de Testes', district: 'Vila de Testes',
        street: 'Rua de Testes Fake', complement: 'galpao', latitude: -23.629037, longitude: -46.712689, postalCode: '85045020', number: '3454' }
    end

    it 'successfully all the fields' do
      expect(subject).to eq({ country: 'BR', state: 'São Paulo', city: 'Cidade de Testes', district: 'Vila de Testes',
                              street: 'Rua de Testes Fake', complement: 'galpao', latitude: -23.629037, longitude: -46.712689, postal_code: '85045020', number: '3454' })
    end
  end
end
