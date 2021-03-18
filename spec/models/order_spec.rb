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
    it { have_one(:shipping_address).through(:customer) }
  end
end
