describe Spot do
  it_behaves_like :locatable

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:images) }
  it { should have_many(:images).dependent(:destroy) }

  describe "#locatable_images" do
    it { should delegate_method(:locatable_images).to(:images).as(:locatable) }
  end

  describe "callbacks" do
    describe "#before_save" do
      it "calls locate" do
        image = create(:image, location: nil)
        spot = create(:spot, images: [image])

        image.update(location: [1, 1])
        spot.reload

        expect(spot.location).to eq image.location
      end
    end
  end

  describe "#locate" do
    context "with a location" do
      it "does nothing" do
        image = create(:image, location: [10, 10])
        spot = Spot.new(location: [1, 1], images: [image])

        spot.locate

        expect(spot.location).to eq [1, 1]
      end
    end
    context "without images" do
      it "clears the location" do
        spot = build(:spot, location: nil, images: [])

        spot.locate

        expect(spot).not_to be_locatable
      end
    end

    context "with images" do
      it "determines the location from the images" do
        images = [
          create(:image, location: [20, 10]),
          create(:image, location: [-10, -20]),
          create(:image, location: nil)
        ]
        spot = create(:spot, images: images)

        spot.locate

        expect(spot.location.map(&:to_f)).to eq [5.0, -5.0]
      end
    end
  end
end
