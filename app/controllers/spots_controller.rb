class SpotsController < InheritedResources::Base
  def permitted_params
    params.permit spot: [:name]
  end
end