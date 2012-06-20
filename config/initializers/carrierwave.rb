
CarrierWave.configure do |config|
config.root = Rails.root.join('tmp')
config.cache_dir = 'uploads'
access_key_id = ENV['AKIAJFOVOZRWULMRYXDQ']
secret_access_key = ENV['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']
bucket = ENV['kaleydoscopio']
end

