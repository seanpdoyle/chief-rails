describe Image do
  it_behaves_like :locatable

  describe "associations" do
    it { should belong_to(:spot) }
    it { should have_attached_file(:file) }
  end

  describe "validations" do
    it { should validate_attachment_presence(:file) }
    it { should validate_attachment_content_type(:file).
         allowing("image/png", "image/gif", "image/jpg").
         rejecting("text/plain", "not_image/xml") }
  end

  describe ".orphan" do
    it "includes Images without a Spot" do
      image = create(:image, spot_id: nil)
      create(:image, spot_id: 0)

      orphaned = Image.orphan

      expect(orphaned).to eq [image]
    end
  end

  describe "#url" do
    it { should delegate_method(:url).to(:file) }
  end
end