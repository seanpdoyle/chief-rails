describe ImagesController, type: :controller do
  describe "#index" do
    it "returns orphan Images" do
      allow(Image).to receive(:orphan).and_return(:orphaned)

      get :index

      expect(assigns[:images]).to be :orphaned
    end
  end
end
