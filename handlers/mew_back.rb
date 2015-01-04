require "yaml"

module Lita
  module Handlers
    class MewBack < Handler
      route /にゃ[ー〜]|ニャ[ー〜]|ﾆｬ[ｰ~]|にゃん|ニャン|ﾆｬﾝ/, :mew
      def mew(response)
        messages = %w(
          にゃー
          にゃーん
          にゃあああん
          ﾆｬｰ
          ﾆｬｰﾝ
          ﾆｬｱｱﾝ
          ﾌｰｯ
          !?
          ...ﾆ?
          そんなことより飯をよこせ
        )
        reply response, messages.sample
      end

      route /可愛い|かわいい|カワイイ|ｶﾜｲｲ/, :cute_me
      def cute_me(response)
        messages = %w(
          俺のこと！？
        )
        reply response, messages.sample
      end

      route /[（(]ΦωΦ[)）]/, :angry
      def angry(response)
        messages = %w(
          ｼｬｰｯ!
          ﾌｰｯ!
        )
        reply response, messages.sample
      end

      route /なんなん/, :nyannyan
      def nyannyan(response)
        messages = %w(
          にゃんにゃん！
          ニャンニャン！
          ﾆｬﾝﾆｬﾝ!
          娘々
          謝々
        )
        reply response, messages.sample
      end

      route /せやな/, :seyaseya
      def seyaseya(response)
        messages = %w(
          せやせや
          せやろか
          ちゃうで
        )
        reply response, messages.sample
      end

      route /せやせや/, :seyana
      def seyana(response)
        messages = %w(
          せやな
          せやろか
          ちゃうで
        )
        reply response, messages.sample
      end

      route /せやろか/, :seyaroka
      def seyaroka(response)
        messages = %w(
          せやで
          せやせや
          ちゃうで
        )
        reply response, messages.sample
      end

      route /せやで/, :seyade
      def seyade(response)
        messages = %w(
          せやな
          せやせや
          せやろか
          ちゃうで
        )
        reply response, messages.sample
      end

      route /せやかて/, :seyakate
      def seyakate(response)
        return if rand(100) < 10

        messages = %w(
          工藤
        )
        reply response, messages.sample
      end

      route /ちゃうんちゃう/, :chauchau
      def chauchau(response)
        messages = %w(
          せやろか
          せやせや
          せやな
        )
        reply response, messages.sample
      end

      route /ちゃうで/, :chaude
      def chaude(response)
        messages = %w(
          せやろか
          せやせや
          せやな
        )
      end

      route /縄/, :comeon!
      def comeon!(response)
        messages = %w(
          やれるもんならかかってきやがれ、だニャー！
        )
        reply response, messages.sample
      end

      route /よしよし|ヨシヨシ|ﾖｼﾖｼ|なでなで|ナデナデ|ﾅﾃﾞﾅﾃﾞ/, :curr
      def curr(response)
        messages = %w(
          ｺﾞﾛｺﾞﾛ
        )
        reply response, messages.sample
      end

      route /^help/, :help
      def help(response)
        return unless response.user.metadata["mention"]
        response.reply_with_mention "May this song help you: https://www.youtube.com/watch?v=yWP6Qki8mWc"
      end

      on :unhandled_message, :on_unhandled_message
      def on_unhandled_message(payload)
        message = payload[:message]
        return unless message.user.metadata["mention"]
        message.reply_with_mention "にゃ〜ん？"
      end

      private

        def reply(response, string)
          if response.user.metadata["mention"]
            response.reply_with_mention string
          else
            response.reply string
          end
        end
    end
    Lita.register_handler(MewBack)
  end
end
