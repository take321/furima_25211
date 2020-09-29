FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { gimei.last.kanji }
    first_name            { gimei.first.kanji }
    family_name_kana      { gimei.last.katakana }
    first_name_kana       { gimei.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
