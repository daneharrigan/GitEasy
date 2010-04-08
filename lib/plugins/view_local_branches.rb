module GitEasy
  module Plugins
    module ViewLocalBranches
      def self.command
        '--view-local-branches'
      end

      def self.call(parameters)
        puts "Your local branches are:\n"
        puts "  "+GitEasy.local_branches.join("\n  ")
      end
    end
  end
end

GitEasy.add_command(GitEasy::Plugins::ViewLocalBranches)