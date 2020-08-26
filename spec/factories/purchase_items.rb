FactoryBot.define do
  factory :purchase_item do
    association :item
    association :user
  end
end
