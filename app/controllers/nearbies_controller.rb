class NearbiesController < ApplicationController
  def show
    @nearby = Nearby.new(nearby_params)

    render json: @nearby.spots, meta: @nearby, each_serializer: SpotSerializer, root: "spots"
  end

  private

  def nearby_params
    params.slice(:latitude, :longitude, :radius)
  end
end
