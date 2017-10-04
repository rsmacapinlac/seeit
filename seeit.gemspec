
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "seeit/version"

Gem::Specification.new do |spec|
  spec.name          = "seeit"
  spec.version       = Seeit::VERSION
  spec.authors       = ["Ritchie Macapinlac"]
  spec.email         = ["ritchie@macapinlac.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.homepage      = "http://github.com/rsmacapinlac/seeit"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://www.rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_dependency 'webshot'
  spec.add_dependency "activesupport"
  spec.add_dependency "poltergeist", "~> 1.12.0"
  spec.add_dependency "faye-websocket", "~> 0.7.3"
  spec.add_dependency "mini_magick", "~> 4.3.3"

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
