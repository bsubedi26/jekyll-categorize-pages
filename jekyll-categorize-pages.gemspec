# frozen_string_literal: true

# $LOAD_PATH.unshift File.expand_path("lib", __dir__)
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "jekyll-categorize-pages/version"

Gem::Specification.new do |s|
  s.name          = "jekyll-categorize-pages"
  s.version       = JekyllCategorizePages::VERSION
  s.authors       = [""]
  s.email         = [""]
  s.homepage      = ""
  s.summary       = "Reusable Jekyll Plugin."

  s.files         = `git ls-files app lib`.split("\n")

  s.require_paths = ["lib"]
  s.license       = "MIT"

  s.add_dependency "jekyll", "~> 3.6"
  # s.add_runtime_dependency("jekyll", "~> 3.0")
end
