Paperclip.registered_attachments_styles_path = 'config/paperclip_attachments.yml'

if Rails.configuration.x.paperclip.s3
  Paperclip::Attachment.default_options.tap do |options|
    options[:storage] = :s3
    options[:s3_headers] = -> attachment do
      {}.tap do |headers|
        if attachment
          headers["Expires"] = (attachment.updated_at || Time.now).next_year.httpdate
        end
      end
    end
    options[:s3_host_alias] = ENV.fetch("UPLOAD_HOST", "uploads.wheelbytes.com")
    options[:url] = ":s3_alias_url"
    options[:path] = "/:class/:attachment/:id_partition/:style/:filename"
    options[:s3_credentials] = {
      bucket: ENV.fetch("AWS_BUCKET"),
      access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID"),
      secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY")
    }
  end
end
