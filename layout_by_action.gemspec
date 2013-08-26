# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'layout_by_action/version'

Gem::Specification.new do |spec|
  spec.name          = "layout_by_action"
  spec.version       = LayoutByAction::VERSION
  spec.authors       = ["barelyknown"]
  spec.email         = ["barelyknown@icloud.com"]
  spec.description   = %q{Add layout_by_action method to application controllers}
  spec.summary       = %q{Add layout_by_action method to application controllers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"

  spec.add_dependency "activesupport"
end
