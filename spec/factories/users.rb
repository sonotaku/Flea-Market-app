FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name} 
    family_name {"山田"}
    first_name {"太郎"}
    flat_family_name {"ヤマダ"}
    flat_first_name {"タロウ"}
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday {"2000-2-23"}

    # Gimeiを使ったテスト用Factory Bot（なぜかGimei使えない）

    # gimei = Gimei.name
    # nickname {Faker::Name.last_name} 
    # family_name = gimei.last.kanji 
    # first_name = gimei.first.kanji
    # flat_family_name = gimei.last.katakana 
    # flat_first_name = gimei.first.katakana
    # email { Faker::Internet.free_email }
    # password = Faker::Internet.password(min_length: 6)
    # password {password}
    # password_confirmation {password}
    # birthday {"2000-2-23"}
  end
end
