# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lookout/jruby/version'

Gem::Specification.new do |spec|
  spec.name          = "lookout-jruby"
  spec.version       = Lookout::Jruby::VERSION
  spec.authors       = ["Ian Smith"]
  spec.email         = ["ian.smith@lookout.com"]
  spec.summary       = %q{JRuby hacks}
  spec.description   = %q{JRuby hacks for some yaml issues}
  spec.homepage      = "https://github.com/lookout/lookout-jruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", '~> 10.2'
  spec.add_development_dependency 'rspec', '~> 3.3'
end
