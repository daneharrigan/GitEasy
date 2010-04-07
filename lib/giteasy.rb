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
end