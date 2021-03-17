describe Purchase::Customer do
  subject { described_class.new(payload).call }

  let(:payload) do
    {
      buyer: {
        id: customer_id,
        nickname: nickname,
        email: email,
        phone: { area_code: area_code, number: number }
      }
    }
  end

  context 'when all the values are present' do
    let(:customer_id) { 136_226_073 }
    let(:nickname) { 'JOHN DOE' }
    let(:email) { 'john@doe.com' }
    let(:area_code) { 41 }
    let(:number) { '999999999' }

    it 'translate them accordingly' do
      expect(subject[:externalCode]).to eq('136226073')
      expect(subject[:name]).to eq('JOHN DOE')
      expect(subject[:email]).to eq('john@doe.com')
      expect(subject[:contact]).to eq('41999999999')
    end
  end
end
