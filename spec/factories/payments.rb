FactoryBot.define do
  factory :payment do
    option { 'credit_card' }
    value  { 9.99 }
    order
  end
end
