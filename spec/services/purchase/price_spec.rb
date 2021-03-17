describe Purchase::Price do
  subject { described_class.new(payload).call }

  let(:payload) do
    {
      total_amount: total_amount,
      total_shipping: total_shipping,
      total_amount_with_shipping: total_amount_with_shipping
    }
  end

  context 'when all the values are present' do
    let(:total_amount) { 49.9 }
    let(:total_shipping) { 5.14 }
    let(:total_amount_with_shipping) { 55.04 }

    it 'translate them accordingly' do
      expect(subject[:subTotal]).to eq('49.90')
      expect(subject[:deliveryFee]).to eq('5.14')
      expect(subject[:total_shipping]).to eq(5.14)
      expect(subject[:total]).to eq('55.04')
    end
  end

  context 'when shipping is nil' do
    let(:total_amount) { 27 }
    let(:total_shipping) { nil }
    let(:total_amount_with_shipping) { 27 }

    it 'translate them accordingly' do
      expect(subject[:subTotal]).to eq('27.00')
      expect(subject[:deliveryFee]).to eq('0.00')
      expect(subject[:total_shipping]).to eq(0.0)
      expect(subject[:total]).to eq('27.00')
    end
  end
end
