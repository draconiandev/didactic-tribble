#
FactoryGirl.define do
  factory :destination do
    name        Faker::Address.city
    description Faker::Lorem.paragraph(2)
    brief       Faker::Lorem.sentence
    cover       { File.open("#{Rails.root}/spec/fixtures/files/card.jpg") }
  end
end
