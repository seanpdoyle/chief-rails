describe Spot do
  it_behaves_like :locatable

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:images) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }

  it { should have_many(:images).dependent(:destroy) }

  describe "#locate" do
    context "with a location" do
      it "does nothing" do
        image = create(:image, location: [10, 10])
        spot = Spot.new(location: [1, 1], images: [image])

        spot.locate

        expect(spot.location).to eq [1, 1]
      end
    end

    context "with images" do
      it "determines the location from the images" do
        images = [
          build(:image, location: [20, 10]),
          build(:image, location: [-10, -20]),
          build(:image, location: nil)
        ]
        spot = Spot.new(id: 1, latitude: nil, longitude: nil, images: images)

        spot.locate

        expect(spot.location.map(&:to_f)).to eq [5.0, -5.0]
      end
    end
  end
end
