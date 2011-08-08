# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "presenter/version"

Gem::Specification.new do |s|
  s.name        = "active-record-presenters"
  s.version     = Presenter::VERSION
  s.authors     = ["August Lilleaas"]
  s.email       = ["august@augustl.com"]
  s.homepage    = ""
  s.summary     = %q{Object oriented helpers for Rails/ActiveRecord}
  s.description = %q{Object oriented helpers for Rails/ActiveRecord}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

