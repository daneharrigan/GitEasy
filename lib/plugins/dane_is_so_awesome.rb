module GitEasy
  module Plugins
    module DaneIsSoAwesome
      def self.command
        '--dane-is-so-awesome'
      end

      def self.call(parameters)
        puts "dane is pretty awesome"
      end
    end
  end
end

GitEasy.add_command(GitEasy::Plugins::DaneIsSoAwesome)