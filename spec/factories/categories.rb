FactoryGirl.define do
  factory :category do
    name            Faker::Commerce.product_name
    description     Faker::Lorem.paragraph(2)
    brief           Faker::Lorem.sentence
    slug            Faker::Internet.slug
    cover           { File.open("#{Rails.root}/spec/fixtures/files/card.jpg") }
    main_category   'air'
  end
end
