require "yaml"

module Lita
  module Handlers
    class MewBack < Handler
      route /にゃ[ー〜]|ニャ[ー〜]|ﾆｬ[ｰ~]|にゃん|ニャン|ﾆｬﾝ/, :mew
      def mew(response)
        response.reply_with_mention MESSAGES["mew"].sample
      end

      route /可愛い|かわいい|カワイイ|ｶﾜｲｲ/, :cute_me
      def cute_me(response)
        response.reply_with_mention MESSAGES["cute_me"].sample
      end

      route /[（(]ΦωΦ[)）]/, :angry
      def angry(response)
        response.reply_with_mention MESSAGES["angry"].sample
      end

      route /^help/, :help
      def help(response)
        return unless response.user.metadata["mention"]
        response.reply_with_message MESSAGES["help"].sample
      end

      on :unhandled_message, :on_unhandled_message
      def on_unhandled_message(payload)
        message = payload[:message]
        return unless message.user.metadata["mention"]
        message.reply_with_mention "にゃ〜ん？"
      end

      private

        def mention(response)
          "@#{response.user.name}"
        end
    end
    Lita.register_handler(MewBack)
  end
end
