# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cs_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'cs_client'
  spec.version       = CsClient::VERSION
  spec.authors       = ['unmanbearpig']
  spec.email         = ['unmanbearpig@gmail.com']
  spec.summary       = 'blah'
  spec.description   = ''
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.6.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'awesome_print'

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday-cookie_jar'
  spec.add_runtime_dependency 'nokogiri'
  spec.add_runtime_dependency 'activesupport'
end
