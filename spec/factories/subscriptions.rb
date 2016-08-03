FactoryGirl.define do
  factory :subscription do
    association :vendor, factory: :vendor
    association :category, factory: :category
  end
end
