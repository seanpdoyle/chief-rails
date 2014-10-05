describe "GET /spots", type: :request do
  context "with location parameters" do
    it "returns Spots near the location" do
      spot = create(:spot, :located)
      params = {
        radius: 5,
        latitude: spot.latitude,
        longitude: spot.longitude,
      }

      get "/spots", { format: :json }.merge(params)

      expect(response.status).to eq 200
      expect(response).to match_response_schema("nearby")
    end
  end

  it "returns spots" do
    create(:spot, :located, images: [ create(:image) ])

    get "/spots", format: :json

    expect(response.status).to eq 200
    expect(response).to match_response_schema("spots")
  end
end

describe "GET /spots/:id", type: :request do
  it "returns spots" do
    spot = create(:spot, :located, images: [ create(:image) ])

    get "/spots/#{spot.to_param}", format: :json

    expect(response.status).to eq 200
    expect(response).to match_response_schema("spot")
  end
end

describe "POST /spots", type: :request do
  it "creates a spot" do
    image = create(:image, :located)
    spot_params = attributes_for(:spot, image_ids: [image.id])
    post "/spots", format: :json, spot: spot_params

    expect(response.status).to eq 201
    expect(response).to match_response_schema("spot")
  end

  it "returns malformed request when invalid" do
    post "/spots", format: :json, spot: {}

    expect(response.status).to eq 422
    expect(response).to match_response_schema("spot.invalid")
  end
end
