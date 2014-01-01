Paperclip.registered_attachments_styles_path = 'config/paperclip_attachments.yml'

if Rails.configuration.x.paperclip.s3
  Paperclip::Attachment.default_options.tap do |options|
    options[:storage] = :s3
    options[:s3_protocol] = ''
    options[:s3_headers] = -> attachment do
      {}.tap do |headers|
        if attachment
          headers["Expires"] = (attachment.updated_at || Time.now).next_year.httpdate
        end
      end
    end
    options[:s3_credentials] = {
      bucket: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
  end
end