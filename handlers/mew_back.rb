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

        def body
          %w(
            にゃー
            にゃーん
            にゃあああん
            ﾆｬｰ
            ﾆｬｰﾝ
            ﾆｬｱｱﾝ
            ﾌｰｯ
            !?
          ).sample
        end
    end
    Lita.register_handler(MewBack)
  end
end
