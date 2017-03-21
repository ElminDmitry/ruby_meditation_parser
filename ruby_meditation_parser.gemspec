# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_meditation_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_meditation_parser"
  spec.version       = RubyMeditationParser::VERSION
  spec.licenses      = "MIT"
  spec.summary       = %q{Library for parse www.rubymeditation.com}
  spec.description   = %q{Library for parse www.rubymeditation.com}
  spec.authors       = ["Dmitryi Yelmin"]
  spec.email         = ["elmin.mailbox@gmail.com"]
  spec.platform      = Gem::Platform.local
  spec.version       = '1.0.0.pre'

  spec.homepage      = 'https://github.com/ElminDmitry/ruby_meditation_parser'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]
end
