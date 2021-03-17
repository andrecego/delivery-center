describe Purchase::Processor do
  subject { described_class.new(payload).call }

  context 'when all the values are present' do
    let(:payload) do
      input_file = File.read(Rails.root.join('spec/fixtures/input.json'))
      JSON.parse(input_file, symbolize_names: true)
    end

    let(:output) do
      output_file = File.read(Rails.root.join('spec/fixtures/output.json'))
      JSON.parse(output_file, symbolize_names: true)
    end

    it 'translate them accordingly' do
      expect(subject).to eq(output)
    end
  end
end
