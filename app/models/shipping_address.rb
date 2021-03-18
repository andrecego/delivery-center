class ShippingAddress < ApplicationRecord
  validates :country, :state, :city, :district, :street, :complement, :latitude, :longitude, :postal_code, :number,
            presence: true
  validates :latitude, inclusion: -90..90
  validates :longitude, inclusion: -180..180

  belongs_to :customer
  has_many :orders, dependent: :destroy
end
