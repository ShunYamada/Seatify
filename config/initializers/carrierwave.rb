CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 'seatify-mvp-pro'
      config.cache_storage = :fog
    when 'development'
      config.fog_directory = 'seatify-mvp-dev'
      config.cache_storage = :fog
  end
end
