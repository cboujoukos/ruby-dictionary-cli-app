
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_dictionary/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_dictionary"
  spec.version       = RubyDictionary::VERSION
  spec.authors       = ["Chris Boujoukos"]
  spec.email         = ["cboujoukos@gmail.com"]

  spec.summary       = %q{Ruby Dictionary}
  spec.description   = %q{This gem allows the user to look up useful information on public methods right from the command line.}
  spec.homepage      = "https://github.com/cboujoukos/cli-data-gem-assessment-v-000.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
#  if spec.respond_to?(:metadata)
#    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"
#  else
#    raise "RubyGems 2.0 or newer is required to protect against " \
#      "public gem pushes."
#  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
#  spec.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.executables << "ruby-dictionary"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~>0"

  spec.add_runtime_dependency "nokogiri"
end
