Gem::Specification.new do |s|
  s.name        = "nerdword-client"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.license     = "MIT"
  s.authors     = ["Eric Oestrich"]
  s.email       = ["dev@smartlogicsolutions.com"]
  s.homepage    = "http://github.com/smartlogic/nerdword-client-ruby"
  s.summary     = "Ruby client for the NerdWord API"
  s.description = "Ruby client for the NerdWord API"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "json"
  s.add_development_dependency "rspec"

  s.files        = Dir.glob("lib/**/*")
  s.require_path = 'lib'
end
