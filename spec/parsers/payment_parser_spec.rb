describe PaymentParser do
  subject { described_class.parse(params) }

  describe 'parse' do
    let(:params) { { type: 'CREDIT_CARD', value: 55.04 } }

    it 'successfully all the fields' do
      expect(subject).to eq({ option: 'credit_card', value: 55.04 })
    end
  end
end
