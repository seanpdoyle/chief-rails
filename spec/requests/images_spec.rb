describe "GET /images/:id", type: :request do
  it "returns the image" do
    image = create(:image, :located)

    get image_path(image), format: :json

    expect(response.status).to eq 200
    expect(response).to match_response_schema("image.single")
  end
end

describe "DELETE /images/:id", type: :request do
  it "deletes the image" do
    image = create(:image)

    delete image_path(image), format: :json

    expect(response.status).to eq 200
  end
end

describe "GET /images", type: :request do
  it "includes all images" do
    create(:image, :located)

    get images_path, format: :json

    expect(response.status).to eq 200
    expect(response).to match_response_schema("images")
  end
end
