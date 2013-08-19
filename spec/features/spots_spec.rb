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
        all('.spot-name').each do |element|
          expect(element).to have_content spot.name.titleize
        end
      end
    end
  end

  scenario 'displays the link to the spot' do
    spot = create :spot

    visit spots_path

    within "##{dom_id(spot)}" do
      find("a.spot-name").click

      expect(current_path).to eq spot_path(spot)
    end
  end
end

feature 'Nearest Spots' do
  let(:spot) { create :spot, lat: 1, lng: 1 }
  let!(:spots) do
    6.times.map do |offset_in_miles|
      nearby = spot.endpoint(90, offset_in_miles)
      create :spot, lat: nearby.lat, lng: nearby.lng
    end
  end

  scenario 'viewing a spot displays the 5 closest spots, closest to furthest' do
    visit spot_path(spot)

    expect(nearby_spots.count).to be <= 5

    spots.first(5).each do |nearby|
      expect(page).to have_nearby_spot(nearby)
    end

    expect(page).not_to have_nearby_spot(spots.last)

    expect(page).not_to have_nearby_spot(spot)
  end
end

feature 'Creating Spots' do
  before do
    visit spots_path

    find('#new_spot').click
  end

  scenario 'from the #new_spot form' do
    photo = Photos::WITH_EXIF
    create_spot name: 'new spot', photo: photo

    spot = Spot.last

    expect(current_path).to eq spot_path(spot)

    expect(spot.name).to eq 'new spot'
    expect(spot.slug).to eq 'new-spot'

    expect(spot.lat).to be_within(1.0e-12).of(photo.lat)
    expect(spot.lng).to be_within(1.0e-12).of(photo.lng)

    expect(page).to have_content spot.name.titleize
    expect_photo spot.photo(:large), spot.name
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