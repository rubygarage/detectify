# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'detectify/version'

Gem::Specification.new do |spec|
  spec.name               = 'detectify'
  spec.version            = Detectify::VERSION
  spec.authors            = ['Lukyanov Fedor']
  spec.email              = ['lukyanov.f.ua@gmail.com']

  spec.summary            = 'Write a short summary, because Rubygems requires one.'
  spec.description        = 'Write a longer description or delete this line.'
  spec.homepage           = 'https://rubygarage.org'
  spec.license            = 'MIT'

  spec.files              = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths      = ['lib']
  s.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'fuubar', '~> 2.0'
end
