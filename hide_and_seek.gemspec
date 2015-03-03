$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hide_and_seek/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hide_and_seek"
  s.version     = HideAndSeek::VERSION
  s.authors     = ["BJ Clark"]
  s.email       = ["bjclark@scidept.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HideAndSeek."
  s.description = "TODO: Description of HideAndSeek."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
