FactoryBot.define do
  factory :form_item_option do
    form_item { nil }
    label { Faker::Lorem.question }
    value { Faker::Lorem.word }
  end
end
