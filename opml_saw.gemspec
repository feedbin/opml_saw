# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opml_saw/version'

Gem::Specification.new do |gem|
  gem.name          = "opml_saw"
  gem.version       = OpmlSaw::VERSION
  gem.authors       = ["Ben Ubois"]
  gem.email         = ["ben@benubois.com"]
  gem.description   = %q{Parse OPML into a flat hash.}
  gem.summary       = %q{Parse OPML into a flat hash.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency "nokogiri"
end
