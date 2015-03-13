class Gem::Commands::PluginCommand < Gem::Command
  def initialize
    super("plugin", "Generate skeleton for a rubygems plugin")
  end

  def execute
    RubygemsPluginGenerator::Generator.start(options[:args])
  end
end
