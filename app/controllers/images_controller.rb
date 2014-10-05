class ImagesController < ApplicationController
  def index
    @images = Image.orphan

    render json: @images
  end

  def show
    @image = find_image

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

  def destroy
    @image = find_image

    @image.destroy!

    head 200
  end

  private

  def find_image
    Image.find(params[:id])
  end

  def image_params
    params.fetch(:image, {})
      .permit(:file, :latitude, :longitude, :spot_id)
  end
end
