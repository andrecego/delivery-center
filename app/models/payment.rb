class Payment < ApplicationRecord
  validates :option, :value, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :order

  enum option: { credit_card: 10, debit: 20, pix: 30 }
end
