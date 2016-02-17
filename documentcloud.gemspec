# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'document_cloud/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'rest-client', '~> 1.6.7'
  spec.add_dependency 'multi_json', '~> 1.8'

  spec.name          = 'documentcloud'
  spec.version       = DocumentCloud::Version
  spec.description   = 'Rubygem for interacting with the DocumentCloud API'
  spec.summary       = spec.description
  spec.authors       = ['Miles Zimmerman']
  spec.email         = ['miles@zserver.org']
  spec.homepage      = 'https://github.com/mileszim/documentcloud'
  spec.licenses      = ['MIT']

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
end
