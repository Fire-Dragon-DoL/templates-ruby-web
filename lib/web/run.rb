require "puma/cli"
require "web/app"

module Web
  module Run
    module Defaults
      def self.options
        {
          host: "0.0.0.0",
          port: 4000
        }
      end
    end

    def self.call(options = {})
      options = Defaults.options.merge(options)

      puma_config = ::Puma::Configuration.new({}) do |config|
        config.app ::Web::App.build
        config.bind "tcp://#{options[:host]}:#{options[:port]}"
      end
      puma = Puma::Launcher.new(puma_config, events: Puma::Events.stdio)

      puma.run
    end
  end
end
