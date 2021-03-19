class Item < ApplicationRecord
  validates :external_code, :name, :price, :quantity, :total, presence: true
  validates :external_code, uniqueness: { case_sensitive: false }
  validates :price, :total, numericality: { greater_than_or_equal_to: 0 }
  validate :total_value
  has_many :order_items
  has_many :orders, through: :order_items

  def total_value
    return if price.blank? || quantity.blank? || total.blank?
    return if price * quantity == total

    errors.add(:total, 'must be equal to the sum of the prices')
  end
end
