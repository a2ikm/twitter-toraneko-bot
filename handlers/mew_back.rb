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

      route /なんなん/, :nyannyan
      def nyannyan(response)
        messages = [
          "にゃんにゃん！",
          "ニャンニャン！",
          "ﾆｬﾝﾆｬﾝ!",
          "娘々",
          "謝々",
        ]
        response.reply_with_mention messages.sample
      end

      route /せやな/, :seyaseya
      def seyaseya(response)
        messages = [
          "せやせや",
          "せやろか",
          "ちゃうで",
        ]
        response.reply_with_mention messages.sample
      end

      route /せやせや/, :seyana
      def seyana(response)
        messages = [
          "せやな",
          "せやろか",
          "ちゃうで",
        ]
        response.reply_with_mention messages.sample
      end

      route /せやろか/, :seyaroka
      def seyaroka(response)
        messages = [
          "せやで",
          "せやせや",
          "ちゃうで",
        ]
        response.reply_with_mention messages.sample
      end

      route /せやで/, :seyade
      def seyade(response)
        messages = [
          "せやな",
          "せやせや",
          "せやろか",
          "ちゃうで",
        ]
        response.reply_with_mention messages.sample
      end

      route /せやかて/, :seyakate
      def seyakate(response)
        return if rand(100) < 10

        messages = [
          "工藤",
        ]
        response.reply_with_mention messages.sample
      end

      route /ちゃうんちゃう/, :chauchau
      def chauchau(response)
        messages = [
          "せやろか",
          "せやせや",
          "せやな",
        ]
        response.reply_with_mention messages.sample
      end

      route /ちゃうで/, :chaude
      def chaude(response)
        messages = [
          "せやろか",
          "せやせや",
          "せやな",
        ]
      end

      route /縄/, :comeon!
      def comeon!(response)
        messages = [
          "やれるもんならかかってきやがれ、だニャー！",
        ]
        response.reply_with_mention messages.sample
      end

      route /よしよし|ヨシヨシ|ﾖｼﾖｼ|なでなで|ナデナデ|ﾅﾃﾞﾅﾃﾞ/, :curr
      def curr(response)
        messages = [
          "ｺﾞﾛｺﾞﾛ",
        ]
        response.reply_with_mention messages.sample
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
    end
    Lita.register_handler(MewBack)
  end
end
