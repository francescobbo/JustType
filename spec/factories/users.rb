FactoryGirl.define do
  factory :user, aliases: [:author] do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    password 's3cr3t'
    password_confirmation 's3cr3t'

    trait :admin do
      admin true
    end
  end
end
