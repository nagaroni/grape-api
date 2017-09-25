ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'

env = ENV['GRAPE_ENV'] ||= 'development'

# require all gems in the gemfile
Bundler.require(:default, env)
root_path = File.expand_path('../.', __dir__)

Dir["#{root_path}/app/**/**/*.rb"].each do |file|
  require file
end

