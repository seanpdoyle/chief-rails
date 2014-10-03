# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :located do
    location [10, 15]
  end

  trait :locatable do
    ignore do
      location []
    end

    after :stub, :build do |locatable, evaluator|
      location = Array(evaluator.location)
      locatable.latitude = location.first
      locatable.longitude = location.last
    end
  end

  factory :image do
    locatable

    file_file_name "spec/fixtures/with-exif.jpg"
    file_content_type "image/jpg"
  end

  factory :spot do
    sequence(:name) { |i| "spot #{i}" }

    locatable
  end
end
