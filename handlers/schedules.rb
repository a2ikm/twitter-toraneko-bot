module Lita
  module Handlers
    class Schedules < Handler
      def self.default_config(handler_config)
        handler_config.room     = nil
        handler_config.yawn_at  = nil
      end

      on :loaded do |payload|
        return unless config.room

        @scheduler = Rufus::Scheduler.new

        if yawn_at = config.yawn_at
          @scheduler.cron yawn_at do
            robot.trigger :yawn, room: config.room
          end
        end
      end

      on :yawn do |payload|
        return unless rand(10) < 6

        messages = [
          "クァー",
          "クァッ",
          "ｸｧｰ",
          "ｸｧｯ",
        ]
        source = Source.new(room: payload[:room])
        robot.send_message source, messages.sample
      end

      private

        def config
          Lita.config.handlers.schedules
        end
    end

    Lita.register_handler(Schedules)
  end
end
