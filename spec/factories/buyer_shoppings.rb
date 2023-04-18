FactoryBot.define do
  factory :buyer_shopping do
    post_code { '123-4567' }
    region_id {Faker::Number.between(from: 2, to: 47)}
    municipality { '寝屋川市' }
    address { '1-1' }
    building { '東京ハイツ' }
    telephone { '09084754458' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
