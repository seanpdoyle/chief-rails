module Paperclip
  class Location < Processor
    def make
      gps = EXIFR::JPEG.new(file.path).gps
      if gps.present? && attachment.present?
        attachment.update! lat: gps.latitude, lng: gps.longitude
      end
      file
    end
  end
end