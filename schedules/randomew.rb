module Lita
  module Schedules
    class Randomew < Schedule

      cron '16 * * * * Asia/Tokyo', :randomew
      def randomew
        text = MESSAGES["randomew"].sample
        TWITTER_CLIENT.update text
      end
    end
    Lita.register_schedule(Randomew)
  end
end
