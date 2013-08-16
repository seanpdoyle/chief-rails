module Features
  PHOTO_ROOT = File.join Rails.root, 'spec', 'support', 'photos'
  PHOTO_WITH_EXIF = File.join PHOTO_ROOT, 'with-exif.jpg'

  def find_photo(url, alt = nil)
    selector = "img[src='#{url}']"
    if alt.present?
      selector = "#{selector}[alt='#{alt}']"
    end
    find(selector)
  end
end