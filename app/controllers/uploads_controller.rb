class UploadsController < ApplicationController
  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      render json: @upload
    else
      render json: { errors: @upload.errors }, status: 422
    end
  end

  private

  def upload_params
    params.fetch(:upload, {}).permit(:url)
  end
end
