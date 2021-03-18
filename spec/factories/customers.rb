FactoryBot.define do
  factory :customer do
    sequence(:external_code) { |n| "000#{n}" }
    name                     { 'Fakenaldo da Silva' }
    sequence(:email)         { |n| "fake#{n}@test.com" }
    contact                  { '11999999999' }
  end
end
