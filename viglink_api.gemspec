# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'viglink_api/version'

Gem::Specification.new do |gem|
  gem.name          = "viglink-api"
  gem.version       = ViglinkApi::VERSION
  gem.authors       = ["Clayton Liggitt"]
  gem.email         = ["mail@enorganik.com"]
  gem.description   = "Viglink API Wrapper"
  gem.summary       = "This gem is a wrapper for the Viglink Catalog API.  This gem contains module methods for each API endpoint, as well as an additional subset for the CUID revenue API."
  gem.homepage      = "https://github.com/arktisklada/viglink-api"
  gem.license       = 'GPL-2'
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday', '~> 0.8'
  gem.add_dependency 'faraday_middleware', '~> 0.9'
  gem.add_dependency 'hashie'
  gem.add_dependency 'multi_xml'
  gem.add_dependency 'activesupport'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'simplecov-rcov'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'shoulda'
  gem.add_development_dependency 'webmock'
end
