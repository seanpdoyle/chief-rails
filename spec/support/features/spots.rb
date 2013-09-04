module Features
  def spot(name)
    find('.spot .spot-name', text: name)
  end

  def add_spot_obstacle(obstacle)
    within '#new_spot_obstacle' do
      fill_in 'obstacle', with: obstacle
      submit_form
    end
  end

  def directions_to(spot)
    find "##{dom_id(spot)} a[rel=directions]"
  end

  def have_nearby_spot(nearby)
    have_css ".spots-nearby .spot##{dom_id(nearby)}"
  end

  def nearby_spots
    all('.spots-nearby .spot')
  end

  def create_spot(name: nil, photo: Photos::WITH_EXIF)
    within '#new_spot' do
      fill_in 'spot_name', with: name
      attach_file 'spot_photo', photo.path
      submit_form
    end

    Spot.find_by(slug: name.parameterize).tap do |spot|
      spot.photo.reprocess_without_delay!
    end
  end
end