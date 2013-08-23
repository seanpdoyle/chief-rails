module ApplicationHelper
  def directions_link_to(text = '', has_location = nil, opts = {})
    if has_location.respond_to? :lat, :lng
      options = opts.merge(rel: 'directions', target: '_blank')
      location = [has_location.lat, has_location.lng].join(',')
      link_to text, "//maps.google.com?daddr=#{location}", options
    end
  end
end