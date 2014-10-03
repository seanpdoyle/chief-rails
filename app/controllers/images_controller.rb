class ImagesController < ApplicationController
  def create
    @image = Image.create!(image_params)

    render json: @image, status: 201
  end

  def index
    @images = Image.all

    render json: @images
  end

  private

  def image_params
    params.require(:image)
      .permit(:file, :latitude, :longitude)
  end
end
