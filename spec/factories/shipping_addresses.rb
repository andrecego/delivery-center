FactoryBot.define do
  factory :shipping_address do
    country     { 'BR' }
    state       { 'São Paulo' }
    city        { 'Cidade Fake' }
    district    { 'Bairro Fake' }
    street      { 'Rua Fake' }
    complement  { 'Casa 2' }
    latitude    { 33.812101 }
    longitude   { 117.919009 }
    postal_code { '08290080' }
    number      { '42' }
    customer
  end
end
