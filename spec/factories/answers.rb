FactoryBot.define do
  factory :answer do
    value { Faker::Lorem.sentence }
  end
end
