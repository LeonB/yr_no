# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yr_no/version'

Gem::Specification.new do |spec|
  spec.name          = "yr_no"
  spec.version       = YrNo::VERSION
  spec.authors       = ["Leon Bogaert"]
  spec.email         = ["leon@tim-online.nl"]
  spec.summary       = %q{yr.no API wrapper in Ruby}
  spec.description   = %q{yr.no API wrapper in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('faraday')
  spec.add_dependency('multi_json')
  spec.add_dependency('hashie')

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
