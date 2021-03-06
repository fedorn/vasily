# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vasily/version'

Gem::Specification.new do |spec|
  spec.name          = "vasily"
  spec.version       = Vasily::VERSION
  spec.authors       = ["Fedor Nikolaev"]
  spec.email         = ["fsqcds@gmail.com"]

  spec.summary       = %q{Ruby gem for textocat.com API}
  spec.homepage      = "https://github.com/fedorn/vasily"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "httparty"
end
