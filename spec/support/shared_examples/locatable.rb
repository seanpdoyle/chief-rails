shared_examples_for :locatable do
  it { should allow_value(90).for(:latitude) }
  it { should allow_value(-90).for(:latitude) }
  it { should_not allow_value(91).for(:latitude) }
  it { should_not allow_value(-91).for(:latitude) }

  it { should allow_value(180).for(:longitude) }
  it { should allow_value(-180).for(:longitude) }
  it { should_not allow_value(181).for(:longitude) }
  it { should_not allow_value(-181).for(:longitude) }

  describe "#location" do
    it "returns an array with [latitude, longitude]" do
      locatable = described_class.new(latitude: 10, longitude: 15)

      location = locatable.location

      expect(location).to eq [10, 15]
    end
  end

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
