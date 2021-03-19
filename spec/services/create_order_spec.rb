describe CreateOrder do
  subject { described_class.new(payload).call }

  context 'when the validator is valid' do
    let(:payload) do
      input = File.read(Rails.root.join('spec/fixtures/input.json'))
      JSON.parse(input, symbolize_names: true)
    end

    it 'return status ok' do
      expect(subject.first).to eq(:ok)
    end

    it 'return order created' do
      expect(subject.last[:text]).to eq('order created')
    end

    it 'creates an order' do
      subject
      order = Order.last
      expect(order.external_code).to eq('9987071')
      expect(order.total).to eq(55.04)
      expect(order.shipping_address.postal_code).to eq('85045020')
      expect(order.customer.external_code).to eq('136226073')
      expect(order.items.size).to eq(1)
      expect(order.payments.size).to eq(1)
    end
  end

  context 'when the validator is invalid' do
    let(:payload) { {} }

    before do
      validator_mock = double('validator')
      allow(PurchaseValidate).to receive(:new).and_return(validator_mock)
      allow(validator_mock).to receive(:invalid?).and_return(true)
      allow(validator_mock).to receive(:response).and_return(OpenStruct.new(status: 400, body: '[total] are required'))

      processor_mock = double('processor')
      allow(Purchase::Processor).to receive(:new).and_return(processor_mock)
      allow(processor_mock).to receive(:call).and_return({})
    end

    it 'return status bad_request' do
      expect(subject.first).to eq(400)
    end

    it 'return order created' do
      expect(subject.last[:text]).to eq('[total] are required')
    end
  end

  context 'when the input payload is invalid' do
    let(:payload) do
      input = File.read(Rails.root.join('spec/fixtures/input.json'))
      input = JSON.parse(input, symbolize_names: true)
      input.merge(total_amount_with_shipping: 0)
    end

    it 'return status bad_request' do
      expect(subject.first).to eq(:bad_request)
    end

    it 'return order created' do
      expect(subject.last[:text]).to eq('Validation failed: Total must be equal to the sum of the subtotal plus ' +
                                        'shipping cost, Total must be equal to the sum of the payments')
    end

    it 'doesnt create any order' do
      subject
      expect(Order.count).to eq(0)
      expect(ShippingAddress.count).to eq(0)
      expect(Customer.count).to eq(0)
      expect(Item.count).to eq(0)
      expect(Payment.count).to eq(0)
    end
  end
end
