FactoryBot.define do
  factory :user do
    nickname =  Faker::Name.last_name 
    family_name = Gimei.name.last.kanji 
    first_name = Gimei.name.first.kanji 
    flat_family_name = Gimei.name.last.katakana 
    flat_first_name = Gimei.name.first.katakana 
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end