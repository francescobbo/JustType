FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    password 's3cr3t'
    password_confirmation 's3cr3t'
  end
end
