describe Order, type: :model do
  describe 'validations' do
    subject { build(:order) }

    it { should validate_presence_of(:external_code) }
    it { should validate_presence_of(:store_id) }
    it { should validate_presence_of(:subtotal) }
    it { should validate_presence_of(:shipping_cost) }
    it { should validate_presence_of(:total) }
    it { should validate_presence_of(:date_created) }

    it { should validate_uniqueness_of(:external_code).case_insensitive }
    it { should validate_numericality_of(:subtotal).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:shipping_cost).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:total).is_greater_than_or_equal_to(0) }

    it { should belong_to(:customer) }
    it { should belong_to(:shipping_address) }
    it { should have_many(:payments) }
    it { should have_many(:items) }

    describe '.total_sum' do
      let(:payments) { build_list(:payment, 1, value: total) }
      subject { build(:order, total: total, subtotal: subtotal, shipping_cost: shipping_cost, payments: payments) }

      context 'when the sum of subtotal and shipping cost is equal to the total' do
        let(:total)         { 26.90 }
        let(:subtotal)      { 20.00 }
        let(:shipping_cost) { 6.90 }

        it { is_expected.to be_valid }
      end

      context 'when the sum of subtotal and shipping cost is different to the total' do
        let(:total)         { 26.90 }
        let(:subtotal)      { 20.00 }
        let(:shipping_cost) { 6.91 }

        it 'is invalid and shows an error message' do
          expect(subject).to be_invalid
          expect(subject.errors.full_messages)
            .to eq(['Total must be equal to the sum of the subtotal plus shipping cost'])
        end
      end
    end

    describe '.total_paid' do
      let(:subtotal) { total }
      let(:shipping_cost) { 0 }
      subject { build(:order, total: total, payments: payments, subtotal: subtotal, shipping_cost: shipping_cost) }

      context 'with only one payment' do
        let(:payments) { build_list(:payment, 1, value: value) }

        describe 'with the total equal to the payment value' do
          let(:total) { 50.23 }
          let(:value) { 50.23 }

          it { is_expected.to be_valid }
        end

        describe 'with the total different to the payment value' do
          let(:total) { 50.23 }
          let(:value) { 50.24 }

          it 'is invalid and shows an error message' do
            expect(subject).to be_invalid
            expect(subject.errors.full_messages).to eq(['Total must be equal to the sum of the payments'])
          end
        end
      end

      context 'with multiple payments' do
        let(:payments) { build_list(:payment, 2, value: value) }

        describe 'with the total equivalent to the payment value' do
          let(:total) { 50.22 }
          let(:value) { 25.11 }

          it { is_expected.to be_valid }
        end

        describe 'with the total different to the sum of payments' do
          let(:total) { 50.23 }
          let(:value) { 25.11 }

          it 'is invalid and shows an error message' do
            expect(subject).to be_invalid
            expect(subject.errors.full_messages).to eq(['Total must be equal to the sum of the payments'])
          end
        end
      end
    end
  end
end
