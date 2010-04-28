module GitEasy
  @commands = {}

  def self.commands
    @commands.keys
  end

  # preferences can be stored in your .git/config file, following the normal
  # precedence rules for same (put these in ~/.gitconfig for global options, etc)
  #
  # These preferences must be stored in a giteasy section of that file
  #
  # Sample
  #[giteasy]
  #  settingone = true
  #  defaultremote = false
  #
  # preference keys can/should be determined by the command itself, with a few
  # global command we'll use everywhere (the default remote name, for example)
  def self.prefs(key)
    system "git config --get giteasy.#{key}"
  end

  def self.call(command, parameters)
    @commands[command].call(parameters)
  end

  def self.add_command(mod)
    @commands[mod.command] = mod
  end

  def self.remote_branches
    system 'git fetch > /dev/null'
    branches = `git branch -r`.split("\n")
    branches.map do |line|
      line = line.split('->').last if line =~ /origin\/master/
      line.split('/').last.strip
    end
  end

  def self.local_branches
    branches = `git branch`.split("\n")
    branches.map { |line| line.strip }
  end

  def self.current_branch
    local_branches.each do |branch|
      return branch.sub(/\*/,'').strip if branch =~ /\*/
    end
  end
end