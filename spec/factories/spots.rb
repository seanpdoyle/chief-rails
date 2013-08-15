# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spot do
    sequence(:name) { |i| "spot #{i}" }
    lat 1.5
    lng 1.5
  end
end
