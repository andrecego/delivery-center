describe Purchase::Shipping do
  subject { described_class.new(payload).call }

  let(:payload) do
    {
      shipping: {
        date_created: date_created,
        receiver_address: {
          country: { id: country_id },
          state: { name: state_name },
          city: { name: city_name },
          neighborhood: { name: neighborhood_name },
          street_name: street_name,
          comment: comment,
          latitude: latitude,
          longitude: longitude,
          zip_code: zip_code,
          street_number: street_number
        }
      }
    }
  end

  context 'when all the values are present' do
    let(:country_id) { 'BR' }
    let(:state_name) { 'São Paulo' }
    let(:city_name) { 'Cidade de Testes' }
    let(:neighborhood_name) { 'Vila de Testes' }
    let(:street_name) { 'Rua Fake de Testes' }
    let(:comment) { 'galpao' }
    let(:latitude) { -23.629037 }
    let(:longitude) { -46.712689 }
    let(:date_created) { '2019-06-27T19:59:08.251-04:00' }
    let(:zip_code) { '85045020' }
    let(:street_number) { '3454' }

    it 'translate them accordingly' do
      expect(subject[:country]).to eq('BR')
      expect(subject[:state]).to eq('São Paulo')
      expect(subject[:city]).to eq('Cidade de Testes')
      expect(subject[:district]).to eq('Vila de Testes')
      expect(subject[:street]).to eq('Rua Fake de Testes')
      expect(subject[:complement]).to eq('galpao')
      expect(subject[:latitude]).to eq(-23.629037)
      expect(subject[:longitude]).to eq(-46.712689)
      expect(subject[:dtOrderCreate]).to eq('2019-06-27T19:59:08.251Z')
      expect(subject[:postalCode]).to eq('85045020')
      expect(subject[:number]).to eq('3454')
    end
  end
end
