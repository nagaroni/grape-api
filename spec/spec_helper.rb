GRAPE_ENV='test'

require 'simplecov'
require './config/application.rb'
require 'rack/test'

SimpleCov.start do
  add_group 'resources', 'app/resources'
end

Dir['./spec/support/**/*.rb'].each do |file|
  puts require file
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Rack::Test::Methods
  config.include App::Helpers
end
