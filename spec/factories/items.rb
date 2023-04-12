FactoryBot.define do
  factory :item do
    title {"題名"}
    textbox {"内容"}
    price {Faker::Number.between(from: 1, to: 9999999)}
    category_id {Faker::Number.between(from: 2, to: 10)}
    prefecture_id {Faker::Number.between(from: 2, to: 7)}
    postage_id {Faker::Number.between(from: 2, to: 3)}
    region_id {Faker::Number.between(from: 2, to: 47)}
    shipment_id {Faker::Number.between(from: 2, to: 4)}
    association :user 
  end
end
