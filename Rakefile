desc "This task is called by the Heroku cron add-on"
task :ping do
   require 'net/http'
   uri = URI.parse('http://twitter-toraneko-bot.herokuapp.com/')
   Net::HTTP.get(uri)
 end
