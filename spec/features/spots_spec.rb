require 'spec_helper'

feature 'Spots' do

  scenario 'viewing no spots' do
    visit spots_path
    expect(page).to have_content /no spots/i
  end

  scenario 'viewing spots' do
    spots = create_list :spot, 2

    visit spots_path

    spots.each do |spot|
      within "##{dom_id(spot)}" do
        expect(find('aside')).to have_content spot.name.titleize
      end
    end
  end

  scenario 'clicking spot' do
    spot = create :spot

    visit spots_path

    within "##{dom_id(spot)}" do
      find("aside").find("a").click

      expect(current_path).to eq spot_path(spot)
    end
  end
end