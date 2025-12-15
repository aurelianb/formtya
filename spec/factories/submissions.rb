FactoryBot.define do
  factory :submission do
    submitter { Faker::Name.name }
  end
end
