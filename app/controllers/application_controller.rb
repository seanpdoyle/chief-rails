class ApplicationController < ActionController::API
  include Clearance::Controller

  rescue_from ActionController::ParameterMissing do
    head 422
  end
end
