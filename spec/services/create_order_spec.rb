describe CreateOrder do
  subject { described_class.new(payload).call }

  context 'when the validator is valid' do
    let(:payload) do
      input = File.read(Rails.root.join('spec/fixtures/input.json'))
      JSON.parse(input, symbolize_names: true)
    end

    it 'should return status ok' do
      expect(subject.first).to eq(:ok)
    end

    it 'should return order created' do
      expect(subject.last[:text]).to eq('order created')
    end

    it 'created an order' do
      subject
      expect(Order.all.count).to eq(1)
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

    it 'should return status bad_request' do
      expect(subject.first).to eq(400)
    end

    it 'should return order created' do
      expect(subject.last[:text]).to eq('[total] are required')
    end
  end
end
