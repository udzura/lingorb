lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lingorb/version"

Gem::Specification.new do |spec|
  spec.name          = "lingorb"
  spec.version       = Lingorb::VERSION
  spec.authors       = ["Uchio Kondo"]
  spec.email         = ["udzura@udzura.jp"]

  spec.summary       = %q{Yet another duoling unofficial API binding}
  spec.description   = %q{Yet another duoling unofficial API binding}
  spec.homepage      = "https://github.com/udzura/lingorb"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.15"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
