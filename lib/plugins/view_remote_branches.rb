module GitEasy
  module Plugins
    module ViewRemoteBranches
      def self.command
        '--view-remote-branches'
      end

      def self.call(parameters)
        puts "Your remote branches are:\n"
        puts "  "+GitEasy.remote_branches.join("\n  ")
      end
    end
  end
end

GitEasy.add_command(GitEasy::Plugins::ViewRemoteBranches)