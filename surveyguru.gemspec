# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "surveyguru/version"

Gem::Specification.new do |s|
  s.name        = "surveyguru"
  s.version     = Surveyguru::VERSION
  s.authors     = ["ready4god2513"]
  s.email       = ["brandonh@ibethel.org"]
  s.homepage    = ""
  s.summary     = %q{A DSL for building surveys and reports}
  s.description = %q{I needed a survey builder for Rails.  I searched everywhere.  What I found was either out of date, or had 3m dependencies that I just didn"t want to use in my project.  So I am building surveyguru.}

  s.rubyforge_project = "surveyguru"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency("rails", "~> 3.2")
  s.add_dependency("simple_form")
end
