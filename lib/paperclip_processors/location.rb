class Location < Paperclip::Processor
  def make
    if can_process?
      attachment.instance.lat = gps.latitude
      attachment.instance.lng = gps.longitude
    end
    file
  end

  private
    def gps
      @gps ||= EXIFR::JPEG.new(file.path).gps
    end

    def can_process?
      gps.present? && attachment.present? && attachment.instance.present?
    end
end