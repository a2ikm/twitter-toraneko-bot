module Lita
  module Handlers
    class Followed < Handler
      on :followed, :follow_back

      def follow_back(payload)
        user = payload[:user]
        TWITTER_CLIENT.follow(user.name)
      end
    end
    Lita.register_handler(Followed)
  end
end
