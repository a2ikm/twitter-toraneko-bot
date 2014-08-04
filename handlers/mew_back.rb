require "yaml"

module Lita
  module Handlers
    class MewBack < Handler
      route /にゃー|ニャー|ﾆｬｰ/, :mew
      def mew(response)
        text = [
          mention(response),
          MESSAGES["mew"].sample,
        ].compact.join(" ")

        response.reply text
      end

      route /可愛い|かわいい|カワイイ|ｶﾜｲｲ/, :cute_me
      def cute_me(response)
        text = [
          mention(response),
          MESSAGES["cute_me"].sample,
        ].compact.join(" ")

        response.reply text
      end

      route /[（(]ΦωΦ[)）]/, :angry
      def angry(response)
        text = [
          mention(response),
          MESSAGES["angry"].sample,
        ].compact.join(" ")

        response.reply text
      end

      private

        def mention(response)
          "@#{response.user.name}"
        end
    end
    Lita.register_handler(MewBack)
  end
end
