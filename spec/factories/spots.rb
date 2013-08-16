# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spot do
    sequence(:name) { |i| "spot #{i}" }
    lat 1.5
    lng 1.5
    photo File.open(File.join(Rails.root, 'spec', 'support', 'photos', 'with-exif.jpg'))
    photo_content_type Spot::ALLOWED_PHOTOS.first
  end
end
