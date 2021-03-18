describe ShippingAddress, type: :model do
  describe 'validations' do
    subject { build(:shipping_address) }

    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:district) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:complement) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:number) }

    it { should validate_inclusion_of(:latitude).in_range(-90..90) }
    it { should validate_inclusion_of(:longitude).in_range(-180..180) }
    it { should belong_to(:customer) }
  end
end
