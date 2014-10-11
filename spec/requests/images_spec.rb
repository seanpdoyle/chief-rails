describe "GET /images/:id", type: :request do
  it "returns the image" do
    image = create(:image, :located)

    get "/images/#{image.to_param}", format: :json

    expect(response.status).to eq 200
    expect(response).to match_response_schema("image.single")
  end
end

describe "DELETE /images/:id", type: :request do
  it "deletes the image" do
    image = create(:image)

    delete "/images/#{image.to_param}", format: :json

    expect(response.status).to eq 200
  end
end

describe "GET /images", type: :request do
  it "includes all images" do
    create(:image, :located)

    get "/images", format: :json

    expect(response.status).to eq 200
    expect(response).to match_response_schema("images")
  end
end

describe "POST /images", type: :request do
  it "creates an image" do
    post "/images", format: :json, image: {
      file: with_exif
    }

    expect(response.status).to eq 201
    expect(response).to match_response_schema("image.single")
  end

  it "rejects an invalid image" do
    post "/images", format: :json, image: {}

    expect(response.status).to eq 422
    expect(response).to match_response_schema("image.invalid")
  end

  def with_exif
    fixture_file_upload("with-exif.jpg", "image/jpeg")
  end
end
