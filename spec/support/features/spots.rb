module Features
  def spot(name)
    find('.spot aside', text: name)
  end

  def create_spot(args = {})
    within '#new_spot' do
      fill_in 'spot_name', with: args[:name]
      find('input[type=submit]').click
    end
  end
end