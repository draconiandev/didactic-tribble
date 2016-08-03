#
FactoryGirl.define do
  factory :activity do
    title                   Faker::Lorem.word
    price                   Faker::Commerce.price
    start_date              Faker::Date.backward(14)
    overview                Faker::Lorem.paragraph(2)
    itinerary               Faker::Lorem.paragraph(2)
    cover                   { File.open("#{Rails.root}/spec/fixtures/files/card.jpg") }
    difficulty              'easy'
    brief                   Faker::Lorem.sentence
    association             :destination, factory: :destination
    association             :vendor, factory: :vendor
  end

  factory :invalid_activity do
    title                   ''
    price                   Faker::Commerce.product_name
    start_date              Faker::Date.forward(23)
    end_date                Faker::Date.backward(14)
    overview                Faker::Lorem.paragraph(2)
    itinerary               Faker::Lorem.paragraph(2)
    cover                   Faker::Lorem.sentence
    difficulty              'easy'
    handcrafted             false
    brief                   Faker::Lorem.sentence
  end
end
