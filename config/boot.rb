ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'

env = ENV['GRAPE_ENV'] ||= 'development'

# require all gems in the gemfile
Bundler.require(:default, env)
root_path = File.expand_path('../.', __dir__)
Bundler.load

require 'roar/json'
require 'roar/json/hal'
require 'roar/decorator'


ActiveSupport::Dependencies.autoload_paths += %w(
  app/models
  app/endpoints
  app/representers
)

Dir["#{root_path}/app/**/**/*.rb"].sort.each do |file|
  require file
end

ActiveRecord::Base.configurations = YAML.load_file("#{root_path}/config/database.yml")

ActiveRecord::Base.establish_connection env.to_sym

