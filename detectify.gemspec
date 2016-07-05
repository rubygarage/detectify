# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'detectify/version'

Gem::Specification.new do |spec|
  spec.name          = 'detectify'
  spec.version       = Detectify::VERSION
  spec.authors       = ['Lukyanov Fedor']
  spec.email         = ['fedor@rubygarage.org']

  spec.summary       = 'Detect ActiveRecord entity via domain or subdomain'
  spec.description   = 'Detectify provides a simple way to retrieve an ActiveRecord entity' \
                       'based on the domain/subdomain request information.'
  spec.homepage      = 'https://github.com/rubygarage/detectify'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rack', '>= 1.6'
  spec.add_dependency 'activerecord', '>= 4.2'

  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'fuubar', '~> 2.0'
end
