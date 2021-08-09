FactoryBot.define do
  factory :user do
    nickname              {'yabebe'}
    name                  {'矢部夢乃'}
    email                 {Faker::Internet.free_email}
    password              {'selfy0000'}
    password_confirmation {password}
    birthday              {'1997-10-07'}
    phone                 {'09000000000'}
  end
end
