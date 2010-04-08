module GitEasy
  module Plugins
    module CheckoutRemoteBranch
      def self.command
        '--checkout-remote-branch'
      end

      def self.call(parameters)
        branch_name = 'origin/'+parameters['--checkout-remote-branch']

        unless GitEasy.remote_branches.include? branch_name
          puts "\nThe #{branch_name} does not exist!\n\n"
          exit
        end

        system "git checkout -t #{branch_name}"
      end
    end
  end
end

GitEasy.add_command(GitEasy::Plugins::CheckoutRemoteBranch)