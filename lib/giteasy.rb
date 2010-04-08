module GitEasy
  @commands = {}

  def self.commands
    @commands.keys
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