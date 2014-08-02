module Lita
  module Handlers
    class Mew < Handler
      route /にゃー/, :mew

      def mew(response)
        text = [
          reply_to(response),
          make_body
        ].compact.join(" ")

        response.reply text
      end

      private

        def reply_to(response)
          "@#{response.user.name}" if response.user.metadata["mention"]
        end

        def make_body
          %w(
            にゃー
            にゃーん
            にゃあああん
            ﾆｬｰ
            ﾆｬｰﾝ
            ﾆｬｱｱﾝ
            ﾌｰｯ
            zzz...
            !?
          ).sample
        end
    end
    Lita.register_handler(Mew)
  end
end
