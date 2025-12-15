FactoryBot.define do
  factory :foorm do
    title { Faker::Company.name() }
  end
end
