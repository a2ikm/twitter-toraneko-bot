if ENV['RACK_ENV'] !='production'
  require 'dotenv'
  Dotenv.load
end

MESSAGES = YAML.load_file(File.expand_path("../messages.yml", __FILE__))

TWITTER_CLIENT = ::Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["API_KEY"]
  config.consumer_secret     = ENV["API_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

Dir[File.expand_path("../{handlers,schedules}/*.rb", __FILE__)].each do |file|
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
end
