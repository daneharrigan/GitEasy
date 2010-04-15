module GitEasy
  module Plugins
    module MakeRemoteBranchFromMaster
      def self.command
        '--make-remote-branch-from-master'
      end

      def self.call(parameters)
        branch_name = parameters[command]

        if GitEasy.remote_branches.include? branch_name
          puts "\nThe #{branch_name} already exist!\n\n"
          exit
        end

        system "git push origin master:refs/heads/#{branch_name}"
        system "git checkout -tb #{branch_name} origin/#{branch_name}"
      end
    end
  end
end

GitEasy.add_command(GitEasy::Plugins::MakeRemoteBranchFromMaster)