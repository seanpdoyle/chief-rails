describe "GET /spots", type: :request do
  context "with location parameters" do
    it "returns Spots near the location" do
      spot = create(:spot, :located)
      params = {
        radius: 5,
        latitude: spot.latitude,
        longitude: spot.longitude,
      }

      get spots_path, { format: :json }.merge(params)

      expect(response.status).to eq 200
      expect(response).to match_response_schema("nearby")
    end
  end

  it "returns spots" do
    create(:spot, :located, images: [ create(:image) ])

    get spots_path, format: :json

    expect(response.status).to eq 200
    expect(response).to match_response_schema("spots")
  end
end

describe "GET /spots/:id", type: :request do
  it "returns spots" do
    spot = create(:spot, :located, images: [ create(:image) ])

    get spot_path(spot), format: :json

    expect(response.status).to eq 200
    expect(response).to match_response_schema("spot.single")
  end
end

describe "PUT /spots/:id", type: :request do
  it "returns malformed request when invalid" do
    spot = create(:spot)

    put spot_path(spot), format: :json, spot: { name: nil }

    expect(response.status).to eq 422
    expect(response).to match_response_schema("spot.invalid")
  end

  it "updates the spot" do
    spot = create(:spot)

    put spot_path(spot), format: :json, name: "updated"

    expect(response.status).to eq 200
  end
end

describe "POST /spots", type: :request do
  it "creates a spot" do
    post spots_path, format: :json, spot: spot_params

    expect(response.status).to eq 201
    expect(response).to match_response_schema("spot.single")
  end

  it "returns malformed request when invalid" do
    post spots_path, format: :json, spot: {}

    expect(response.status).to eq 422
    expect(response).to match_response_schema("spot.invalid")
  end
end

def spot_params
  image = create(:image, :located)
  attributes_for(:spot, image_ids: [image.id]).except(:location)
end
