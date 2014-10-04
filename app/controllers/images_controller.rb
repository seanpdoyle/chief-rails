class ImagesController < ApplicationController
  def index
    @images = Image.orphan

    render json: @images
  end

  def show
    @image = Image.find(params[:id])

    render json: @image
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      render status: 201, json: @image
    else
      render status: 422, json: { errors: @image.errors }
    end
  end

  private

  def image_params
    params.fetch(:image, {})
      .permit(:file, :latitude, :longitude)
  end
end
