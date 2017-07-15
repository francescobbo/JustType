FactoryGirl.define do
  factory :post do
    user
    title { Faker::Lorem.sentence }
    rendered_content { Faker::Lorem.paragraphs(5).join("\n\n") }
  end
end
