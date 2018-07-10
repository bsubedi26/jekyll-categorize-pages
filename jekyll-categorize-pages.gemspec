# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("lib", __dir__)

Gem::Specification.new do |s|
  s.name          = "jekyll-categorize-pages"
  s.version       = "0.1.3".freeze
  s.authors       = [""]
  s.email         = [""]
  s.homepage      = ""
  s.summary       = "Reusable Jekyll Plugin."

  s.files         = `git ls-files app lib`.split("\n")
  s.require_paths = ["lib"]
  s.license       = "MIT"

  s.add_runtime_dependency("jekyll", "~> 3.0")
  
end
