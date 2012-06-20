CarrierWave.configure do |config|
config.root = Rails.root.join('tmp')
config.cache_dir = 'uploads'

access_key_id = ENV['AWS_ACCESS_KEY_ID']
secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
bucket = ENV['S3_BUCKET_KALEYDOSCOPIO']
end

