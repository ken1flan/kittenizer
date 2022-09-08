# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kittenizer/version'

Gem::Specification.new do |spec|
  spec.name          = 'kittenizer'
  spec.version       = Kittenizer::VERSION
  spec.authors       = ['ken1flan']
  spec.email         = ['ken1flan@gmail.com']

  spec.summary       = 'Transrate Japanese to Japanese cat language.'
  spec.homepage      = 'https://github.com/ken1flan/kittenizer'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.6'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.8'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
