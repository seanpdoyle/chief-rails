# == Schema Information
#
# Table name: spots
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  slug               :string(255)
#  lat                :float
#  lng                :float
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'spec_helper'

describe Spot, 'validations' do
  context 'with non-null location data' do
    before do
      subject.lat = -91
      subject.lng = -181
    end

    it { should validate_numericality_of(:lat).is_less_than_or_equal_to(90.0) }
    it { should validate_numericality_of(:lat).is_greater_than_or_equal_to(-90.0) }

    it { should validate_numericality_of(:lng).is_less_than_or_equal_to(180.0) }
    it { should validate_numericality_of(:lng).is_greater_than_or_equal_to(-180.0) }
  end
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should have_attached_file(:photo) }

  it { should validate_attachment_presence(:photo) }

  it { should validate_attachment_content_type(:photo).
                allowing('image/jpeg', 'image/png').
                rejecting('text/plain', 'text/xml') }

  # it { should validate_attachment_size(:photo).
  #               in(0..2.megabytes) }

  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug) }
end

describe Spot, '#has_location?' do
  subject { build :spot, lat: lat, lng: lng }
  let(:lat) { nil }
  let(:lng) { nil }

  context 'lat and lng are nil' do
    it { should_not have_location }
  end

  context 'lat is nil' do
    let(:lng) { 0 }
    it { should_not have_location }
  end

  context 'lng is nil' do
    let(:lat) { 0 }
    it { should_not have_location }
  end

  context 'lat and lng are valid' do
    let(:lat) { 0 }
    let(:lng) { 0 }
    it { should have_location }
  end
end

describe Spot do
  [
    :name,
    :slug,
    :lat,
    :lng,
    :photo
  ].each do |message|
    it { should respond_to(message) }
  end
end
