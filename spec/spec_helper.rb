require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter 'spec'
end

require 'redis-datapump'
require 'mock_redis'

RSpec.configure do |config|
  config.mock_with :rspec
  config.order = 'random'
  config.filter_run_excluding skip: true
  config.before(:each) do
     Redis.stub(:new) { raise 'Call to real redis in tests' }
   end
end