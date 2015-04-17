FactoryGirl.define do
  factory :commit do
    sha { Faker::Bitcoin.address }
    committer { Faker::Internet.user_name }
  end
end
