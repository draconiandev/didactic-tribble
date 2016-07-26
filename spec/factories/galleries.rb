#
FactoryGirl.define do
  factory :gallery do
    alt_text     Faker::Internet.slug
    height       Faker::Number.number(3)
    width        Faker::Number.number(3)
    image        { File.open("#{Rails.root}/spec/fixtures/files/card.jpg") }
  end
end
