FactoryBot.define do
  factory :purchase_shipping do
    postal_code      { '123-4567' }
    area_id          { 2 }
    city             { '愛知県' }
    address          { '1-1' }
    building         { '愛知ハイツ' }
    phone            { '09012345678' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
