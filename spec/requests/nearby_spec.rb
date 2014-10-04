describe "GET /nearby", type: :request do
  it "returns Spots near the location, within the search radius" do
    spot = create(:spot, :located)
    params = {
      radius: 5,
      latitude: spot.latitude,
      longitude: spot.longitude,
    }

    get "/nearby", { format: :json }.merge(params)

    expect(response.status).to eq 200
    expect(response).to match_response_schema("nearby")
  end
end
