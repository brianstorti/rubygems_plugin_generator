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

    def create_test_file
      template('templates/test.tt', "#{name}/test/#{name}_command_test.rb")
    end

    def create_rakefile
      template('templates/rakefile.tt', "#{name}/Rakefile")
    end

    def create_gitignore_file
      template('templates/gitignore.tt', "#{name}/.gitignore")
    end

    def init_git_repo
      `cd #{name} && git init && git add .`
    end

    def print_final_message
      say "\n"
      say "*****************************************************************************************"
      say "Please edit #{name}.gemspec with your plugin information."
      say "The file lib/rubygems/commands/#{name}_command.rb was created for you, there you will"
      say "find a method called 'execute'. That's the method that will be called when someone runs"
      say "'gem #{name}'"
      say "*****************************************************************************************"
    end
  end
end
