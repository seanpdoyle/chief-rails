class SpotsController < ApplicationController
  def index
    if nearby.valid?
      @spots = nearby.spots

      render json: @spots, meta: nearby, each_serializer: NearbySerializer
    else
      @spots = Spot.all

      render json: @spots
    end
  end

  def show
    @spot = find_spot

    render json: @spot
  end

  def update
    @spot = find_spot

    if @spot.update(spot_params)
      render status: 200, json: @spot
    else
      render status: 422, json: { errors: @spot.errors }
    end
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

  def find_spot
    Spot.find(params[:id])
  end

  def nearby
    Nearby.new(nearby_params)
  end

  def nearby_params
    params.slice(:latitude, :longitude, :radius)
  end

  def spot_params
    params.fetch(:spot, {})
      .permit(:name, :latitude, :longitude, :image_ids, image_ids: [])
  end
end
