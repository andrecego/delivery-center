describe Customer, type: :model do
  describe 'validations' do
    subject { build(:customer) }

    it { should validate_presence_of(:external_code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:contact) }

    it { should validate_uniqueness_of(:external_code).case_insensitive }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should have_many(:shipping_addresses) }
  end
end
