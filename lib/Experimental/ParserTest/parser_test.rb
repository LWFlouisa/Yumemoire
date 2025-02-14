require "parslet"

class MyParser < Parslet::Parser
  root(:name) { name }

  rule(:name) {
    match['A-Za-z \s'].repeat(1).as(:name)
  }
end

class MyTransform < Parslet::Transform
  rule(name: simple(:n)) { n }
end

begin
  # Usage
  parser = MyParser.new
  transformer = MyTransform.new

  # Parse and transform
  result = transformer.apply(parser.parse("Hello World\n"))


  puts result
rescue Parslet::ParseFailed => error
  puts error.parse_failure_cause.ascii_tree
end
