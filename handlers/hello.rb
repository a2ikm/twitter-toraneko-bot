module Lita
  module Handlers
    class Hello < Handler
      route /^hello/, :hello

      def hello(response)
        response.reply "Hello, world!"
      end
    end
    Lita.register_handler(Hello)
  end
end
