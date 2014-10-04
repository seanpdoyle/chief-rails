class SpotsController < ApplicationController
  def index
    @spots = Spot.all

    render json: @spots
  end

  def show
    @spot = Spot.find(params[:id])

    render json: @spot
  end

  def create
    @spot = Spot.create!(spot_params)

    render json: @spot, status: :created
  end

  private

  def spot_params
    params.require(:spot)
      .permit(:name, :latitude, :longitude, image_ids: [])
  end
end
