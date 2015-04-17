FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.sentence }
    posted_at DateTime.now
    line { Faker::Number.number 2 }
    association :repository
    association :commit
  end
end
