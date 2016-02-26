# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "deep_struct/version"

Gem::Specification.new do |s|
  s.name        = "deep_struct"
  s.version     = Deepstruct::VERSION
  s.authors     = ["Prashant Jois"]
  s.email       = ["p.jois@ivrnet.com"]
  s.homepage    = ""
  s.summary     = %q{A sibling of ostruct that handles deeply nested structures and basic data type detection}
  s.description = %q{A sibling of ostruct that handles deeply nested structures and basic data type detection}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
