module GitEasy
  module Plugins
    module CurrentBranchTracks
      def self.command
        '--current-branch-tracks'
      end

      def self.call(parameters)
        # first, get the current branch name...
        branch_name = GitEasy.current_branch
        found = false
        remote_info_results = `git remote show origin` 
        remote_info_results.each do |line|
          if (line.include?(branch_name)) && (line.include?("pushes to"))
            puts line
            found = true
          end
        end

        unless found
          puts "NO remote tracking set up (use git push origin $REMOT_BRANCH_NAME to push)"
        end
      end
    end
  end
end

GitEasy.add_command(GitEasy::Plugins::CurrentBranchTracks)