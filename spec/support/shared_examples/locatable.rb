shared_examples_for :locatable do
  it_behaves_like :geodesic

  describe ".near" do
    it "includes locatables nearby" do
      nearby = create(described_model, location: [1, 1])
      origin = [1.01, 1.01]

      near_origin = described_class.near(origin)

      expect(near_origin).to eq [nearby]
    end
  end
end
