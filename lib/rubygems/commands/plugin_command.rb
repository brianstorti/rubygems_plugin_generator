class Gem::Commands::PluginCommand < Gem::Command
  def initialize
    super("plugin", "Generate skeleton for a rubygems plugin")
  end

  def execute
    name = options[:args].first
    name = name.tr('-', '_')
    klass = name.split('_').map(&:capitalize).join

    generator_args = []
    generator_args << name
    generator_args << klass

    RubygemsPluginGenerator::Generator.start(generator_args)
  end
end
