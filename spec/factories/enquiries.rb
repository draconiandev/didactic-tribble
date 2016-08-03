#
FactoryGirl.define do
  factory :enquiry do
    name            Faker::Name.name
    message         Faker::Lorem.paragraph(2)
    phone           '+919611201234'
    email           Faker::Internet.email
    association     :activity, factory: :activity
  end
end
