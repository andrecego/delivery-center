describe OrderItem, type: :model do
  describe 'validations' do
    subject { build(:order_item) }

    it { should belong_to(:order) }
    it { should belong_to(:item) }
  end
end
