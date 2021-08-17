# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis-datapump/version'

Gem::Specification.new do |spec|
  spec.name          = 'redis-datapump'
  spec.version       = RedisDatapump::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Leif Gensert']
  spec.email         = ['leif@propertybase.com']
  spec.description   = %q{Tool for Importing and Exporting data from/to redis}
  spec.summary       = %q{This tool is similar to `redis-dump` but is also working with JRuby}
  spec.homepage      = 'http://www.github.com/leifg/redis-datapump'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'redis', '~> 3.0'
  spec.add_dependency 'multi_json', '~> 1.7'
  spec.add_dependency 'json'

  if RUBY_PLATFORM == 'java'
    spec.add_dependency 'jrjackson'
  else
    spec.add_dependency 'yajl-ruby'
  end

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'mock_redis', '~> 0.8'

  spec.add_development_dependency 'rspec', '~> 2.14'
end
