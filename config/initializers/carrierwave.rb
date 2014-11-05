CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => ENV["CARRIERWAVE_PROVIDER"],
    :aws_access_key_id      => ENV["CARRIERWAVE_ACCESS_KEY_ID"],
    :aws_secret_access_key  => ENV["CARRIERWAVE_ACCESS_KEY"]
  }
  config.fog_directory  = ENV["FOG_DIRECTORY"]
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
