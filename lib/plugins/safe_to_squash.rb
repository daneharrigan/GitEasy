module GitEasy
  module Plugins
    module SafeToSquash
      def self.command
        '--safe-to-squash'
      end

      def self.call(parameters)
        going_to = parameters["--safe-to-squash"]
        res = `git log #{going_to}..HEAD --merges`
        # list all the merge commits for that range
        # should come back like:
        #
        # Merge: c54c3f2 a4b5bd4
        # Author: Ryan Wilcox <rwilcox@wilcoxd.com>
        # Date:   Thu Mar 18 10:18:25 2010 -0400
        #
        # Merge branch 'master' of github.com:abatish/bjv3
        #
        # Merge commits will also show up if you had git pull origin master
        # and then try to squash...
        if res.include? "Merge"
          puts "NOT safe to squash - a merge commit is in the way!"
        else
          puts "safe to squash - straight point from #{going_to} up to HEAD"
        end
      end
    end #module SafeToSquash
  end #module Plugins
end # module GitEasy

GitEasy.add_command(GitEasy::Plugins::SafeToSquash)