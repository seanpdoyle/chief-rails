if Rails.configuration.x.paperclip.s3
  config.paperclip_defaults = {
    storage: :s3,
    s3_protocol: "",
    s3_credentials: {
      s3_protocol: "",
      bucket: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
  }
end