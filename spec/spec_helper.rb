ENV['GRAPE_ENV'] = 'test'

require 'simplecov'
require './config/application.rb'
require 'rack/test'
require 'database_cleaner'

SimpleCov.start do
  add_group 'endpoints', 'app/endpoints'
end

Dir['./spec/support/**/*.rb'].each do |file|
  require file
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
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    FactoryGirl.find_definitions
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
