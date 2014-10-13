describe Upload do
  it { should validate_presence_of(:url) }
  it { should allow_value("http://example.com").for(:url) }
  it { should_not allow_value("example").for(:url) }

  describe "#save" do
    it "enqueues itself" do
      upload = Upload.new(url: "http://google.com")
      allow(Delayed::Job).to receive(:enqueue).with(upload).and_return(:queued)

      saved = upload.save

      expect(saved).to be true
      expect(upload.job).to be :queued
    end

    it "doesn't enqueue if the url is missing" do
      allow(Delayed::Job).to receive(:enqueue)
      upload = Upload.new

      saved = upload.save

      expect(saved).not_to be
      expect(Delayed::Job).not_to have_received(:enqueue)
    end
  end

  describe "#perform" do
    it "creates an Image from the URL" do
      allow(Image).to receive(:create)
      upload = Upload.new(url: "http://google.com")

      upload.perform

      expect(Image).to have_received(:create).with(file: "http://google.com")
    end
  end
end
