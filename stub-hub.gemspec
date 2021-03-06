# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stub-hub/version'

Gem::Specification.new do |spec|
  spec.name          = "stub-hub"
  spec.version       = Stubhub::VERSION
  spec.authors       = ["Edward Huynh"]
  spec.email         = ["edward@edwardhuynh.com"]
  spec.summary       = %q{Stub an endpoint.}
  spec.description   = %q{StubHub helps with developing against an endpoint.
                          Use stubbed responses to develop against and you will not have to rely on an endpoint
                          that might be a tad unstable. }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   << 'stubhub'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "fakefs", "~> 0.6.0"
  spec.add_development_dependency "rack-test", "~> 0.6.2"
  spec.add_development_dependency "byebug", "~> 3.5.1"

  spec.add_runtime_dependency "thor", "~> 0.19"
  spec.add_runtime_dependency "rack", "~> 1.5"
end
