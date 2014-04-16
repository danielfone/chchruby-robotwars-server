# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rrobots/version"

Gem::Specification.new do |s|
  s.name        = "rrobots"
  s.version     = Rrobots::VERSION
  s.authors     = ["Marcin Michalowski"]
  s.email       = ["h13ronim@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{RRobots is a C-Robots/Robocode clone written entirely in ruby.}
  s.description = %q{RRobots is a simulation environment for robots, these robots have a scanner and a gun, can move forward and backwards and are entirely controlled by ruby scripts.}

  s.rubyforge_project = "rrobots"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "gosu"
end
