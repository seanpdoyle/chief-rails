module Photos
  PHOTO_ROOT = Rails.root.join('spec', 'fixtures')
  WITH_EXIF = OpenStruct.new(
    path: File.join(PHOTO_ROOT, 'with-exif.jpg'),
    lat: 39.99783333333334,
    lng: -75.2495
  ).freeze

  WITHOUT_EXIF = OpenStruct.new(
    path: File.join(PHOTO_ROOT, 'without-exif.jpg'),
    lat: nil,
    lng: nil
  ).freeze
end
