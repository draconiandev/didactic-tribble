#
FactoryGirl.define do
  factory :contact do
    name            Faker::Name.name
    message         Faker::Lorem.paragraph(2)
    phone           '+919611201234'
    email           Faker::Internet.email
  end
end
