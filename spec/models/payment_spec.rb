describe Payment, type: :model do
  describe 'validations' do
    subject { build(:payment) }

    it { should validate_presence_of(:option) }
    it { should validate_presence_of(:value) }
    it { should validate_numericality_of(:value).is_greater_than_or_equal_to(0) }
    it { should define_enum_for(:option).with_values(credit_card: 10, debit: 20, pix: 30) }

    it { should belong_to(:order) }
  end
end
