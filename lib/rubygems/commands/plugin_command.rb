class Gem::Commands::PluginCommand < Gem::Command
  def initialize
    super("plugin", "Generate skeleton for a rubygems plugin")
  end

  def execute
    args = options[:args]

    if args.nil? or args.empty?
      raise Gem::CommandLineError,
            "Please specify a plugin name (e.g. gem plugin foo)"
    end

    name = args.first.tr('-', '_')
    klass = name.split('_').map(&:capitalize).join

    generator_args = []
    generator_args << name
    generator_args << klass

    RubygemsPluginGenerator::Generator.start(generator_args)
  end
end
