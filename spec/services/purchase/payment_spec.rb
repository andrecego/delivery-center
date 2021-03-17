describe Purchase::Payment do
  subject { described_class.new(payload).call }

  let(:payload) do
    {
      payment_type: payment_type,
      total_paid_amount: total_paid_amount
    }
  end

  context 'when all the values are present' do
    let(:payment_type) { 'credit_card' }
    let(:total_paid_amount) { 49.91 }

    it 'translate them accordingly' do
      expect(subject[:type]).to eq('CREDIT_CARD')
      expect(subject[:value]).to eq(49.91)
    end
  end
end
