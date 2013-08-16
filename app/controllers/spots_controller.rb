class SpotsController < InheritedResources::Base
  def permitted_params
    if params[:spot]
      {spot: params.require(:spot).permit(:name, :lat, :lng, :photo)}
    else
      {}
    end
  end
end