FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'000000f'}
    password_confirmation {password}
    surname               {'山田'}
    first_name            {'健太郎'}
    surname_kana          {'ヤマダ'}
    first_name_kana       {'ケンタロウ'}
    birthday              {'1997-01-10'}
  end
end