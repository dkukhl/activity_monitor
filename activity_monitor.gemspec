$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activity_monitor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activity_monitor"
  s.version     = ActivityMonitor::VERSION
  s.authors     = ["dkukhl"]
  s.email       = ["dkukhl@yandex.ru"]
  s.homepage    = "https://github.com/dkukhl/activity_monitor"
  s.summary     = "Track and monitor user actions"
  s.description = "Analytics gem based on public_activity"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails', '~> 5.0.1'
  s.add_dependency 'public_activity'
  s.add_dependency 'groupdate'
  s.add_dependency 'chartkick'

  s.add_development_dependency 'pg'
end
