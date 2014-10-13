describe "POST /sign", type: :request do
  it "returns the required S3 payload" do
    get sign_path, format: :json, name: "file", type: "image/png"

    expect(response.status).to eq 200
    expect(response).to match_response_schema("sign")
  end
end
