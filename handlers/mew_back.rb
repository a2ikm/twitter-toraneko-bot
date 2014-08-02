require "yaml"

module Lita
  module Handlers
    class MewBack < Handler
      route /にゃー/, :reply

      def reply(response)
        text = [
          mention(response),
          body,
        ].compact.join(" ")

        response.reply text
      end

      private

        def mention(response)
          "@#{response.user.name}"
        end

        MESSAGES = YAML.load_file(File.expand_path("../../messages.yml", __FILE__))["mew_back"]

        def body
          MESSAGES.sample
        end
    end
    Lita.register_handler(MewBack)
  end
end
