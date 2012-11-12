# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "rmagick-metadata"
  gem.version       = "0.0.2"
  gem.authors       = ["Eric Berry"]
  gem.email         = ["cavneb@gmail.com"]
  gem.description   = %q{Parses an image using RMagick and parses the metadata}
  gem.summary       = %q{Parses an image using RMagick and parses the metadata}
  gem.homepage      = "http://github.com/cavneb/rmagick-metadata"

  gem.add_development_dependency "micro_test"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
