require 'cane/rake_task'
desc "Run cane to check quality metrics"
Cane::RakeTask.new(:quality) do |config|
  config.style_measure = 120
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

task :default => [:quality, :spec]
