module Features
  def find_photo(url, alt = nil)
    selector = "img[src='#{url}']"
    if alt.present?
      selector = "#{selector}[alt='#{alt}']"
    end
    find(selector)
  end
end