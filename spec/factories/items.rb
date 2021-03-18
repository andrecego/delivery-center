FactoryBot.define do
  factory :item do
    sequence(:external_code) { |n| "IT000#{n}" }
    name                     { 'Produto de teste' }
    price                    { 25.25 }
    quantity                 { 2 }
    total                    { 50.5 }
  end
end
