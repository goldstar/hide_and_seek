$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hide_and_seek/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hide_and_seek"
  s.version     = HideAndSeek::VERSION
  s.authors     = ["BJ Clark"]
  s.email       = ["bjclark@goldstar.com"]
  s.homepage    = "http://www.github.com/goldstar/hide_and_seek"
  s.summary     = "Let your users hide things easily"
  s.description = "Ever need to show something to your users once, or until they dismiss it? Hide and Seek is just that."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "redis"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'combustion', '~> 0.5.3'

end
