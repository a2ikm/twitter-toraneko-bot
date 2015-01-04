if ENV['RACK_ENV'] !='production'
  require 'dotenv'
  Dotenv.load
end

Dir[File.expand_path("../extensions/*.rb", __FILE__)].each do |file|
  require file
end

Lita.deregister_handler(Lita::Handlers::Help)
Lita.deregister_handler(Lita::Handlers::Info)

Dir[File.expand_path("../handlers/*.rb", __FILE__)].each do |file|
  require file
end

Lita.configure do |config|
  config.robot.name       = 'toraneko_bot_'
  config.robot.adapter    = :twitter
  config.robot.log_level  = :debug

  config.redis.url = ENV["REDISTOGO_URL"]
  config.http.port = ENV["PORT"]

  config.adapter.api_key             = ENV['API_KEY']
  config.adapter.api_secret          = ENV['API_SECRET']
  config.adapter.access_token        = ENV['ACCESS_TOKEN']
  config.adapter.access_token_secret = ENV['ACCESS_TOKEN_SECRET']

  config.handlers.schedules.room    = 1
  config.handlers.schedules.yawn_at = "5,15,25,35,45,55 * * * * Asia/Tokyo"
end
