describe "POST /uploads", type: :request do
  it "enqueues an Image creation job" do
    post uploads_path, format: :json, upload: { url: "https://google.com" }

    expect(response.status).to eq 200
    expect(response).to match_response_schema("upload")
  end

  it "returns a malformed status when invalid" do
    post uploads_path, format: :json, upload: { }

    expect(response.status).to eq 422
    expect(response).to match_response_schema("upload.invalid")
  end
end
