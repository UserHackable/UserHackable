
Paperclip::Attachment.default_options[:s3_host_alias] = ENV['ASSET_HOST']
Paperclip::Attachment.default_options[:url] = ':s3_alias_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
# Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'
Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_protocol] = ""
Paperclip::Attachment.default_options[:s3_credentials] = {
        :bucket => ENV['FOG_DIRECTORY'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
Paperclip::Attachment.default_options[:default_url ] = -> (asset) { ActionController::Base.helpers.asset_path('missing.png') }

