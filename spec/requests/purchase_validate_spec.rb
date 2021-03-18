describe PurchaseValidate do
  subject { described_class.new(payload) }

  let(:default_payload) do
    output_file = Rails.root.join('spec/fixtures/output.json')
    JSON.parse(File.read(output_file), symbolize_names: true)
  end

  context 'with the right payload' do
    let(:payload) { default_payload }

    it 'is valid and dont have error message' do
      expect(subject).to be_valid
      expect(subject.errors).to eq('')
    end
  end

  context 'not sending total' do
    let(:payload) { default_payload.except(:total) }

    it 'is invalid and have error message' do
      expect(subject).to be_invalid
      expect(subject.errors).to eq('[total] are required')
    end
  end
end
