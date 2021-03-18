describe BaseParser do
  subject { described_class.parse(params) }

  describe '.translate_keys' do
    before { allow(BaseParser).to receive(:keys_to_translate).and_return(translate_keys) }

    let(:translate_keys) { { originalKey: :original_key, fullname: :name } }
    let(:params) { { originalKey: 1, fullname: 'Denis', otherKey: 'none' } }

    it 'translate only the designated fields' do
      expect(subject).to eq({ original_key: 1, name: 'Denis' })
    end
  end

  describe '.keep_keys' do
    before { allow(BaseParser).to receive(:keys_to_keep).and_return(keep_keys) }

    let(:keep_keys) { %i[name age] }
    let(:params) { { name: 'Denis', age: 20, gender: 'M' } }

    it 'translate only the designated fields' do
      expect(subject).to eq({ name: 'Denis', age: 20 })
    end
  end

  describe '.merge_keys' do
    before { allow(BaseParser).to receive(:merge_keys).and_return(merge_keys) }

    let(:merge_keys) { { name: 'Denis', age: 20, gender: 'M' } }
    let(:params) { {} }

    it 'translate only the designated fields' do
      expect(subject).to eq(merge_keys)
    end
  end
end
