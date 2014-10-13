class UploadsController < ApplicationController
  def create
    @upload = Upload.new(upload_params)

    @upload.save
  end

  private

  def upload_params
    params.require(:upload).permit(:url)
  end
end
