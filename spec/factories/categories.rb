FactoryGirl.define do
  factory :category do
    name { Faker::Space.constellation }
  end
end
