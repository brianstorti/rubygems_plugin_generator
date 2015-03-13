require "rubygems_plugin_generator/version"
require "rubygems/command_manager"

Gem::CommandManager.instance.register_command(:plugin)
