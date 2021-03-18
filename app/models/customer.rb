class Customer < ApplicationRecord
  validates :external_code, :name, :email, :contact, presence: true
  validates :external_code, :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
