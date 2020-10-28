require_relative 'lib/web/version'

Gem::Specification.new do |spec|
  spec.name          = "web"
  spec.version       = Web::VERSION
  spec.authors       = ["Francesco Belladonna"]
  spec.email         = ["francesco@fc5.me"]

  spec.summary       = %q{A short summary}
  spec.description   = %q{A longer description}
  spec.homepage      = "https://github.com/Fire-Dragon-DoL/web"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Fire-Dragon-DoL/web"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "puma", ">= 5.0"
  spec.add_dependency "roda", ">= 3.37"
  spec.add_dependency "tilt", ">= 2.0"

  spec.add_development_dependency "test_bench", ">= 1.2"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", ">= 12"
end
