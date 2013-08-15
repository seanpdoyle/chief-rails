require 'spec_helper'

feature 'Viewing Spots' do
  scenario 'displays the empty prompt when spots are missing' do
    visit spots_path
    expect(page).to have_content /no spots/i
  end

  scenario 'displays the spots' do
    spots = create_list :spot, 2

    visit spots_path

    spots.each do |spot|
      within "##{dom_id(spot)}" do
        expect(find('aside')).to have_content spot.name.titleize
      end
    end
  end

  scenario 'displays the link to the spot' do
    spot = create :spot

    visit spots_path

    within "##{dom_id(spot)}" do
      find("aside").find("a").click

      expect(current_path).to eq spot_path(spot)
    end
  end
end

feature 'Creating Spots' do
  before do
    visit spots_path

    find('#new_spot').click
  end

  scenario 'from the #new_spot form' do
    create_spot name: 'new spot'

    spot = Spot.last

    expect(spot.name).to eq 'new spot'
    expect(spot.slug).to eq 'new-spot'
    expect(spot.photo).not_to be_nil

    expect(current_path).to eq spot_path(spot)

    expect(page).to have_content spot.name.titleize
    expect(find_photo(spot.photo(:large), spot.name)).not_to be_nil
  end
end

feature 'Editing Spot' do
  given(:spot) { create :spot }

  before do
    visit spot_path(spot)
  end

  scenario 'from the #show page' do
    find('#edit_spot').click

    expect(current_path).to eq edit_spot_path(spot)
  end
end

feature 'Deleting Spot' do
  given(:spot) { create :spot }

  before do
    visit edit_spot_path(spot)
  end

  scenario 'from the Edit page' do
    find('#destroy_spot').click

    expect(current_path).to eq spots_path
    expect(Spot.all).to be_empty
  end
end