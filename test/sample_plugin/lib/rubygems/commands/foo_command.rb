class Gem::Commands::FooCommand < Gem::Command
  def initialize
    super("foo", "Add a description here")
  end

  def execute
    # here goes the code that will be executed
    # when someone runs "gem foo"
    say "It works!"
  end
end
