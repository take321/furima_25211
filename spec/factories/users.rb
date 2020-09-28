FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname             {Faker::Name.initials}
    email                {Faker::Internet.free_email}
    password             {Faker::Internet.password(min_length: 6)}
    password_confimation {password}
    family_name          {gimei.last.kanji}
    first_name           {gimei.first.kanji}
    family_name_kana     {gimei.last.katakana}
    first_name_kana      {gimei.first.katakana}
    birthday             {Faker::Date.between}
  end
end
