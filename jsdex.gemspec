# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsdex/version'

Gem::Specification.new do |spec|
  spec.name          = "jsdex"
  spec.version       = Jsdex::VERSION
  spec.authors       = ["Mark Morga"]
  spec.email         = ["markmorga@gmail.com"]
  spec.description   = %q{Builds a site text index and permits client side search}
  spec.summary       = %q{Builds an text index of a set of files (such as the posts for a blog)
and provides a JavaScript library that allows searching of the index
on the browser to return search results.}
  spec.homepage      = "http://www.github.com/mmorga/jsdex"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
