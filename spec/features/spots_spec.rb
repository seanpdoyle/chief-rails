require 'spec_helper'

feature 'Spots' do

  scenario 'with no spots' do
    visit spots_path
    expect(page).to have_content /no spots/i
  end

  scenario 'with spots' do
    spots = create_list(:spot, 2)

    visit spots_path

    spots.each do |spot|
      within "##{dom_id(spot)}" do
        expect(find('aside')).to have_content spot.name.titleize
      end
    end
  end
end