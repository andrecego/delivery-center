describe Item, type: :model do
  describe 'validations' do
    subject { build(:item) }

    it { should validate_presence_of(:external_code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:total) }

    it { should validate_uniqueness_of(:external_code).case_insensitive }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:total).is_greater_than_or_equal_to(0) }

    it { should have_many(:orders) }

    describe '.total_value' do
      subject { build(:item, total: total, price: price, quantity: quantity) }

      context 'when the total is equal to the sum of prices' do
        let(:total) { 50.0 }
        let(:price) { 25.0 }
        let(:quantity) { 2 }

        it { is_expected.to be_valid }
      end

      context 'when the total is different to the sum of prices' do
        let(:total) { 50.0 }
        let(:price) { 25.01 }
        let(:quantity) { 2 }

        it 'is invalid and shows an error message' do
          expect(subject).to be_invalid
          expect(subject.errors.full_messages).to eq(['Total must be equal to the sum of the prices'])
        end
      end
    end
  end
end
