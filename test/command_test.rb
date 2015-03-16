require 'minitest/autorun'
require 'thor'
require 'rubygems/command_manager'
require 'rubygems/test_case'

require_relative '../lib/rubygems_plugin_generator/generator'
require_relative '../lib/rubygems/commands/plugin_command'

class CommandTest < Gem::TestCase
  def setup
    super
    @cmd = Gem::Commands::PluginCommand.new
  end

  def test_execute
    @cmd.handle_options %w[foo-bar_baz]

    save_value = ->(opts) { @opts = opts }
    RubygemsPluginGenerator::Generator.stub(:start, save_value) do |param|
      @cmd.execute
    end

    assert_equal ['foo_bar_baz', 'FooBarBaz'], @opts
  end
end
