module ApplicationHelper
  def directions_link_to(text = '', has_location, opts)
    if has_location.respond_to? :lat, :lng
      location = [has_location.lat, has_location.lng].join(',')
      link_to text, "//maps.google.com?daddr=#{location}", opts
    end
  end
end