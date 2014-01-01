module SpotHelper
  def spot_image_tag(spot, **opts)
    data_arguments = opts.fetch(:data, {})
    data_arguments[:behavior] ||= ""
    data_arguments[:behavior] << " picture"
    data_arguments[:behavior].squish!

    data = {
      media: spot.photo.url(:small),
      media480: spot.photo.url(:medium),
      media800: spot.photo.url(:large)
    }.merge(data_arguments)

    id = dom_id(spot) + "_picture"

    content_tag :figure, id: id, data: data, title: spot.name do
      content_tag :noscript do
        image_tag spot.photo.url(:original), alt: spot.name
      end
    end
  end
end
