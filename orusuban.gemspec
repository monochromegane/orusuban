# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orusuban/version'

Gem::Specification.new do |spec|
  spec.name          = "orusuban"
  spec.version       = Orusuban::VERSION
  spec.authors       = ["monochromegane"]
  spec.email         = ["dev.kuro.obi@gmail.com"]
  spec.description   = %q{IRCチャンネルのお留守番をしてくれるCinchPluginです}
  spec.summary       = %q{IRCチャンネルのお留守番をしてくれるCinchPluginです}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "cinch"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
