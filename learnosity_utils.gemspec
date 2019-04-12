lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/learnosity_utils/version'

Gem::Specification.new do |spec|
  spec.name          = 'learnosity_utils'
  spec.version       = LearnosityUtils::VERSION
  spec.authors       = ['Chris Connell']
  spec.email         = ['getinmypool@gmail.com']

  spec.summary       = 'An easy interface to learnosity endpoints with configuration support'
  spec.homepage      = 'https://github.com/LYNx785/learnosity_utils'
  spec.license       = 'MIT'

  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~>2.0', '>=2.0.1'
  spec.add_development_dependency 'rake', '~>12.3', '>=12.3.2'
  spec.add_development_dependency 'rspec', '~>3.8', '>=3.8.0'
  spec.add_development_dependency 'webmock', '~>3.5', '>=3.5.1'

  spec.add_runtime_dependency 'learnosity-sdk', '0.1.0'
  spec.add_runtime_dependency 'rare', '~>0.1.1'
end
