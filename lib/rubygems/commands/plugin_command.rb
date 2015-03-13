class Gem::Commands::PluginCommand < Gem::Command
  def initialize
    super("plugin", "Generate skeleton for a rubygems plugin")
  end

  def execute
    name = options[:args].first
    klass = name.tr('-', '_').split('_').map(&:capitalize).join

    generator_args = []
    generator_args << name
    generator_args << klass

    RubygemsPluginGenerator::Generator.start(generator_args)
  end
end
