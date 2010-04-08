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

  def self.local_branches
    
  end

  def self.remote_branches
    system 'git fetch'
    branches = `git branch -r`.split("\n")
    branches.map do |line|
      line = line.split('->').last if line =~ /origin\/master/
      line.split('/').last.strip
    end
  end
end