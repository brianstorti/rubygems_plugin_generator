require 'minitest/autorun'
require_relative '../lib/rubygems_plugin_generator/generator'

class GeneratorTest < Minitest::Test
  def teardown
    `rm -rf foo`
  end

  def test_generates_plugin_structure
    RubygemsPluginGenerator::Generator.start(['foo', 'Foo'])

    generated_gemspec = File.read('foo/foo.gemspec')
    fixture_gemspec = File.read('test/sample_plugin/sample_plugin.gemspec')
    assert_equal fixture_gemspec, generated_gemspec

    generated_gemfile = File.read('foo/Gemfile')
    fixture_gemfile = File.read('test/sample_plugin/Gemfile')
    assert_equal fixture_gemfile, generated_gemfile

    generated_rubygems_plugin = File.read('foo/lib/rubygems_plugin.rb')
    fixture_rubygems_plugin = File.read('test/sample_plugin/lib/rubygems_plugin.rb')
    assert_equal fixture_rubygems_plugin, generated_rubygems_plugin

    generated_version = File.read('foo/lib/foo/version.rb')
    fixture_version = File.read('test/sample_plugin/lib/foo/version.rb')
    assert_equal fixture_version, generated_version

    generated_command = File.read('foo/lib/rubygems/commands/foo_command.rb')
    fixture_command = File.read('test/sample_plugin/lib/rubygems/commands/foo_command.rb')
    assert_equal fixture_command, generated_command

    generated_test = File.read('foo/test/foo_command_test.rb')
    fixture_test = File.read('test/sample_plugin/test/foo_command_test.rb')
    assert_equal fixture_test, generated_test

    generated_gitignore = File.read('foo/.gitignore')
    fixture_gitignore = File.read('test/sample_plugin/gitignore')
    assert_equal fixture_gitignore, generated_gitignore
  end
end
