describe "POST /uploads", type: :request do
  it "enqueues an Image creation job" do
    allow_any_instance_of(Upload).to receive(:save)
    post uploads_path, format: :json, upload: { url: "https://google.com" }

    expect(response.status).to eq 200
  end

  it "returns a malformed status when invalid" do
    post uploads_path, format: :json, upload: { }

    expect(response.status).to eq 422
  end
end
