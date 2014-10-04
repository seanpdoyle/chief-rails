# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :located do
    location [10, 15]
  end

  factory :image do
    file_file_name "spec/fixtures/with-exif.jpg"
    file_content_type "image/jpg"
  end

  factory :nearby do
    located
  end

  factory :spot do
    sequence(:name) { |i| "spot #{i}" }

    after :build, :stub do |spot, evaluator|
      if spot.images.blank?
        spot.images = [ build(:image, :located, spot: spot) ]
      end
    end
  end
end
