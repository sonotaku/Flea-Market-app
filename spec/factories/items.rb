FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {"2"}
    condition_id {"2"}
    burden_id {"2"}
    prefecture_id {"2"}
    day_id {"2"}
    price {"300"}
    association :user
  end
end
