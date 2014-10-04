describe Nearby do
  it_behaves_like :geodesic

  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }

  describe "#spots" do
    it "includes spots near the origin" do
      create(:spot, name: "nearby", location: [1, 1])
      create(:spot, name: "ignore", location: [90, 180])

      nearby = Nearby.new(latitude: 1, longitude: 1)
      nearby_spot_names = nearby.spots.pluck(:name)

      expect(nearby_spot_names).to eq ["nearby"]
    end

    it "accepts a radius in miles" do
      create(:spot, name: "nearby", location: [1, 1])

      nearby = Nearby.new(latitude: 1, longitude: 1, radius: 1)
      nearby_spot_names = nearby.spots.pluck(:name)

      expect(nearby_spot_names).to eq ["nearby"]
    end
  end
end
