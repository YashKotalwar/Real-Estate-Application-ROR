# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider:              'AWS',
#     aws_access_key_id:     ENV['AKIAT7MOYZFTI2ZX5UQ3'],
#     aws_secret_access_key: ENV['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'],
#   }
#   config.storage = :fog
#   config.permissions = 0666
#   config.cache_dir = "#{Rails.root}/tmp/"
#   # config.fog_directory  = ENV['FOG_DIRECTORY']
#   config.fog_directory  = ENV['mytestsbuckets2']
#   config.fog_attributes = { 'Cache-Control' => "max-age=#{365.days.to_i}" }
# end
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAT7MOYZFTI2ZX5UQ3',
    aws_secret_access_key: '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',
  }
  config.fog_directory  = 'mytestsbuckets2'
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
end
