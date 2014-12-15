# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stubhub/version'

Gem::Specification.new do |spec|
  spec.name          = "stubhub"
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
end
