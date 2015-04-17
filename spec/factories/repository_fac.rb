FactoryGirl.define do
  factory :repository do
    name { Faker::Name.name }
  end
end
