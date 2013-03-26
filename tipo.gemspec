# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tipo/version'

Gem::Specification.new do |spec|
  spec.name          = "tipo"
  spec.version       = Tipo::VERSION
  spec.authors       = ["Hugo Bastien"]
  spec.email         = ["hugobast@gmail.com"]
  spec.description   = %q{Pure Ruby OpenType font file reader}
  spec.summary       = %q{Incomplete implementation: Reads header tables, GSUB table and name table}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "active_support"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
