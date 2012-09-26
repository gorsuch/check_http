# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'check_http/version'

Gem::Specification.new do |gem|
  gem.name          = "check_http"
  gem.version       = CheckHTTP::VERSION
  gem.authors       = ["Michael Gorsuch"]
  gem.email         = ["michael.gorsuch@gmail.com"]
  gem.description   = %q{a simple interface to gather curl stats against an HTTP resource}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/gorsuch/check_http"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('ethon', '0.5.0')
  gem.add_dependency('kv', '0.0.5')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
end
