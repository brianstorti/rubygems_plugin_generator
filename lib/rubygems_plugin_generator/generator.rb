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
  end
end
