module Lita
  module Handlers
    class Call < Handler
      require "twilio-ruby"

      Twilio.configure do |config|
        config.account_sid = ENV["TWILIO_ACCOUNT_SID"]
        config.auth_token  = ENV["TWILIO_AUTH_TOKEN"]
      end

      route /^call me/, :call_me
      def call_me(response)
        return unless response.user.metadata["mention"]

        if  ENV["CALLERS"].split(",").include?(response.user.name)
          call
          response.reply_with_mention "done"
        else
          response.reply_with_mention "あかんで"
        end
      end

      private

        def call
          client.calls.create(
            from: ENV["TWILIO_FROM"],
            to:   ENV["TWILIO_TO"],
            url:  ENV["TWILIO_URL"]
          )
        end

        def client
          @client ||= Twilio::REST::Client.new
        end
    end

    Lita.register_handler(Call)
  end
end
