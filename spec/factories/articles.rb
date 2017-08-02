FactoryGirl.define do
  factory :article do
    author
    title { Faker::Lorem.sentence }
    rendered_content { Faker::Lorem.paragraphs(5).join("\n\n") }
  end
end
