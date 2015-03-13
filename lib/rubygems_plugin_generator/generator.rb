require 'thor'

module RubygemsPluginGenerator
  class Generator < Thor::Group
    include Thor::Actions

    argument :name
    argument :klass

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_gemspec_file
      template('templates/gemspec.tt', "#{name}/#{name}.gemspec")
    end

    def create_gemfile
      template('templates/gemfile.tt', "#{name}/Gemfile")
    end

    def create_version_file
      template('templates/version.tt', "#{name}/lib/#{name}/version.rb")
    end

    def create_rubygems_plugin_file
      template('templates/rubygems_plugin.tt', "#{name}/lib/rubygems_plugin.rb")
    end

    def create_command_file
      template('templates/command.tt', "#{name}/lib/rubygems/commands/#{name}_command.rb")
    end
  end
end
