module GitEasy
  module Plugins
    module CheckoutRemoteBranch
      def self.command
        '--checkout-remote-branch'
      end

      def self.call(parameters)
        branch_name = 'origin/'+parameters['--checkout-remote-branch']

        system 'git fetch'
        branches = `git branch -r`.split("\n")
        remote_branches = []

        branches.each do |line|
          remote_branches << line.strip.sub('/\*/','')
        end

        unless remote_branches.include? branch_name
          puts "\nThe #{branch_name} does not exist!\n\n"
          exit
        end

        system "git checkout -t #{branch_name}"
      end
    end
  end
end

GitEasy.add_command(GitEasy::Plugins::CheckoutRemoteBranch)