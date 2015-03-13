require 'rubygems_plugin_generator/version'
require 'rubygems/command_manager'
require 'rubygems_plugin_generator/generator'

Gem::CommandManager.instance.register_command(:plugin)
