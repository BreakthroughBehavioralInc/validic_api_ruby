require_relative 'lib/validic_api/version'

Gem::Specification.new do |spec|
  spec.name          = "validic_api"
  spec.version       = ValidicApi::VERSION
  spec.authors       = ["Robert Garcia"]
  spec.email         = ["rgarcia@mdlive.com"]

  spec.summary       = "Validic API"
  spec.description   = "API Wrapper for Validic API v2"
  # spec.homepage      = ""
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.add_dependency "rest-client"

  spec.add_development_dependency "pry"
end
