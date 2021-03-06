require_relative 'lib/emailness/version'

Gem::Specification.new do |spec|
  spec.name          = "emailness"
  spec.version       = Emailness::VERSION
  spec.authors       = ["Jonathan Allard"]
  spec.email         = ["jonathan@allard.io"]

  spec.summary       = %q{Care very little about email validation}
  spec.description   = <<~md

    Email validation with sensible defaults so you can go care about more
    important things.

    * Strives to be trivially easy to choose and use
    * Meant to match HTML5 email validation, happily deviates from RFC 5322
    * Email tags with '+' are allowed
    * Two consecutive dots ('..') are not
    * Cares very little about most other things
  md

  spec.homepage      = "https://github.com/joallard/emailness"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
