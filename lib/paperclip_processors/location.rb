class Location < Paperclip::Processor
  def make
    if can_process?
      model.lat = gps.latitude
      model.lng = gps.longitude
    end
    file
  end

  private
    def gps
      @gps ||= EXIFR::JPEG.new(file.path).gps
    end

    def can_process?
      gps.present? && model.present?
    end

    def model
      if attachment.present?
        @model ||= attachment.instance
      end
    end
end