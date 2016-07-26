#
FactoryGirl.define do
  factory :vendor do
    name            Faker::Name.name
    contact_person  Faker::Lorem.paragraph(2)
    address         Faker::Address.street_address
    city            Faker::Address.city
    pincode         Faker::Address.postcode
    phone           Faker::PhoneNumber.phone_number
    email           Faker::Internet.email
  end
end
