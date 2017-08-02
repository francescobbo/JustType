FactoryGirl.define do
  factory :article do
    author
    title { Faker::Lorem.sentence }
    original_content { Faker::Lorem.paragraphs(5).join("\n\n") }
  end
end
