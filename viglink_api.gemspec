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
  gem.add_dependency 'hashie', '~> 2.0'
  gem.add_dependency 'multi_xml', '~> 0.5.5'
  gem.add_dependency 'activesupport', '>= 3.2'

  gem.add_development_dependency 'rake', '~> 10.1'
  gem.add_development_dependency 'rspec', '~> 2.14.1'
  gem.add_development_dependency 'simplecov', '~> 0.7.1'
  gem.add_development_dependency 'simplecov-rcov', '~> 0.2.3'
  gem.add_development_dependency 'yard', '~> 0.8.7.4'
  gem.add_development_dependency 'vcr', '~> 2.5.0'
  gem.add_development_dependency 'shoulda', '~> 3.0'
  gem.add_development_dependency 'webmock', '~> 1.13.0'
end
