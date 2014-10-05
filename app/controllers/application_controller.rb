class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do
    head 422
  end
end
