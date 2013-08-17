module Features
  def expect_photo(url, alt = nil)
    selector = "//img[contains(@src, '#{url}')]"
    if alt.present?
      selector = "#{selector}[contains(@alt, '#{alt}')]"
    end
    expect(page).to have_xpath(selector)
  end
end