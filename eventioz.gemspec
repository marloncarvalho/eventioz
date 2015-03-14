# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eventioz/version'

Gem::Specification.new do |spec|
  spec.name          = "eventioz"
  spec.version       = Eventioz::VERSION
  spec.authors       = ["Marlon Silva Carvalho"]
  spec.email         = ["marlon.carvalho@gmail.com"]
  spec.summary       = %q{A Ruby client library for the Eventioz platform.}
  spec.description   = %q{A Ruby client library for the Eventioz platform.}
  spec.homepage      = "http://github.com/marloncarvalho/eventioz"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
