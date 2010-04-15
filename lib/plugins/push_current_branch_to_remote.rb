module GitEasy
  module Plugins
    module PushCurrentBranchToRemote
      def self.command
        '--push-current-branch-to-remote'
      end

      def self.call(parameters)
        branch_name = parameters[command]

        if GitEasy.remote_branches.include? branch_name
          puts "\nThe #{branch_name} already exist!\n\n"
          exit
        end

        system "git push origin #{GitEasy.current_branch}:refs/heads/#{branch_name}"
      end
    end
  end
end

GitEasy.add_command(GitEasy::Plugins::PushCurrentBranchToRemote)