require 'bundler/setup'
require 'nerdword-client'

Dir["./spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include CustomMatchers
end
