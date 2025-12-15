FactoryBot.define do
  factory :form_item do
    label { Faker::Lorem.question }
    item_type { FormItem.item_types["input"] }

    trait :dropdown do
      item_type { FormItem.item_types["dropdown"] }
    end
  end
end
