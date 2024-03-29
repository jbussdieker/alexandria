# -*- encoding: utf-8 -*-
require File.expand_path('../lib/alexandria/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joshua Bussdieker"]
  gem.email         = ["josh.bussdieker@moovweb.com"]
  gem.description   = %q{Simple ruby based git server.}
  gem.summary       = %q{Simple ruby based git server. Simple user based repository hosting.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "alexandria"
  gem.require_paths = ["lib"]
  gem.version       = Alexandria::VERSION
end
