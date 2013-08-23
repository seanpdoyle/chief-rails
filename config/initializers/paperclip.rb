Paperclip.registered_attachments_styles_path = 'config/paperclip_attachments.yml'
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'

if Rails.configuration.x.paperclip.s3
  Paperclip::Attachment.default_options.tap do |options|
    options[:storage] = :s3
    options[:s3_protocol] = ''
    options[:s3_credentials] = {
      bucket: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
  end
end