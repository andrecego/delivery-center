class Order < ApplicationRecord
  validates :external_code, :store_id, :subtotal, :shipping_cost, :total, :date_created, presence: true
  validates :external_code, uniqueness: { case_sensitive: false }
  validates :subtotal, :shipping_cost, :total, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :customer
  has_one :shipping_address, through: :customer
end
