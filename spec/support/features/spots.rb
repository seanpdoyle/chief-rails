module Features
  def spot(name)
    find('.spot aside', text: name)
  end

  def create_spot(args = {})
    within '#new_spot' do
      fill_in 'spot_name', with: args[:name]
      fill_in 'spot_lat', with: args.fetch(:lat, 0)
      fill_in 'spot_lng', with: args.fetch(:lng, 0)
      attach_file 'spot_photo', PHOTO_WITH_EXIF 
      find('input[type=submit]').click
    end
  end
end