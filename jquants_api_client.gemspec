lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jquants_api_client/version"

Gem::Specification.new do |spec|
  spec.name          = "jquants_api_client"
  spec.version       = JquantsApiClient::VERSION
  spec.authors       = ["kiwamizamurai"]
  spec.email         = ["24860100+kiwamizamurai@users.noreply.github.com"]

  spec.summary       = %q{Ruby client library for J-Quants API - providing access to Japanese financial market data}
  spec.description   = %q{A Ruby client library for interacting with the J-Quants API, providing easy access to Japanese financial market data including stock prices, corporate information, and financial statements. Supports authentication, data retrieval, and rate limiting.}
  spec.homepage      = "https://github.com/kiwamizamurai/ruby-jquants/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/kiwamizamurai/jquants_api_client"
    spec.metadata["changelog_uri"] = "https://github.com/kiwamizamurai/jquants_api_client/blob/main/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "concurrent-ruby", "~> 1.0"
  spec.add_dependency "faraday"
end
