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
    @spot = Spot.new(spot_params)

    if @spot.save
      render status: 201, json: @spot
    else
      render status: 422, json: { errors: @spot.errors }
    end
  end

  private

  def spot_params
    params.fetch(:spot, {})
      .permit(:name, :latitude, :longitude, image_ids: [])
  end
end
