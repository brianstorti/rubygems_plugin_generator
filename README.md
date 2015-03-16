# Rubygems plugin generator

This is a `RubyGems` plugin to generate `RubyGems` plugins.

## Installation

```bash
$ gem install rubygems_plugin_generator
```

## Usage

`gem plugin <your-plugin-name>`

This command should generate all the code you need to have a working `RubyGems` plugin. Just change the file `lib/rubygems/commands/<your-command>_command.rb` and you should be good to go.

## Example

```bash
$ gem plugin foo

#       create  foo/foo.gemspec
#       create  foo/Gemfile
#       create  foo/lib/foo/version.rb
#       create  foo/lib/rubygems_plugin.rb
#       create  foo/lib/rubygems/commands/foo_command.rb
#       create  foo/test/foo_command_test.rb
#       create  foo/Rakefile
#       create  foo/.gitignore
# 
# *****************************************************************************************
# Please edit foo.gemspec with your plugin information.
# The file lib/rubygems/commands/foo_command.rb was created for you, there you will
# find a method called 'execute'. That's the method that will be called when someone runs
# 'gem foo'
# *****************************************************************************************
```

Here you have the basic structure of a `RubyGems` plugin that just prints a sample message ("It works!").
It also include a sample test that you can use as an inspiration to write your own. You can run the tests with `rake`:

```bash
$ rake test
Run options: --seed 52142

# Running:

.

Finished in 0.011959s, 83.6190 runs/s, 83.6190 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

To build and install your plugin, you can use the `gem` commands, as you would with a normal gem:

```bash
$ gem build foo.gemspec

#   Successfully built RubyGem
#   Name: foo
#   Version: 0.1.0
#   File: foo-0.1.0.gem

$ gem install foo-0.1.0.gem

# Successfully installed foo-0.1.0
# Parsing documentation for foo-0.1.0
# Installing ri documentation for foo-0.1.0
# Done installing documentation for foo after 0 seconds
# 1 gem installed
```

And now you can run you plugin to see it in action:

```bash
$ gem foo

# It works!
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
