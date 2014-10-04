shared_examples_for :locatable do
  it_behaves_like :geodesic

  describe ".locatable" do
    it "includes locatables with a location" do
      create(described_model, location: [])
      locatable = create(described_model, location: [1, 1])

      expect(described_class.locatable).to eq [locatable]
    end
  end

  describe ".near" do
    it "includes locatables nearby" do
      nearby = create(described_model, location: [1, 1])
      origin = nearby.endpoint(0, 0.5).to_a
      create(described_model, location: [])
      create(described_model, location: nearby.endpoint(0, 10).to_a)

      near_origin = described_class.near(origin)

      expect(near_origin).to eq [nearby]
    end
  end
end
