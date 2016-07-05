FactoryGirl.define do
  factory :person do
    name      'Ashok Kumar'
    email     Faker::Internet.email
    password  Faker::Internet.password

    trait :admin do
      role 'admin'
    end

    trait :user do
      role 'user'
    end

    trait :editor do
      role 'editor'
    end
  end
end
