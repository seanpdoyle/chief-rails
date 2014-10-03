class SpotsController < ApplicationController
  def create
    @spot = Spot.create!(spot_params)

    render json: @spot
  end

  private

  def spot_params
    params.require(:spot)
      .permit(:name, :lat, :lng, :photo)
  end
end
