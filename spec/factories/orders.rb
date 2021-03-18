FactoryBot.define do
  factory :order do
    sequence(:external_code) { |n| "999#{n}" }
    store_id                 { 1 }
    subtotal                 { 45.0 }
    shipping_cost            { 5.55 }
    total                    { 50.55 }
    date_created             { Time.zone.now }
    customer
  end
end
