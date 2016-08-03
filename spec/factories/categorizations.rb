FactoryGirl.define do
  factory :categorization do
    association :activity, factory: :activity
    association :category, factory: :category
  end
end
