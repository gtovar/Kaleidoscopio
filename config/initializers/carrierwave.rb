CarrierWave.configure do |config|
if Rails.env.production?
config.root = Rails.root.join('tmp')
config.cache_dir = 'uploads'
config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
  }
  config.fog_directory  = ENV['kaleydoscopio']
  config.fog_public     = true                                    # optional, defaults to true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}  # optional, defaults to {}
else
 #for development and testing locally
  config.storage = :file
  config.enable_processing = false
 end
end


