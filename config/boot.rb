ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'

env = ENV['GRAPE_ENV'] ||= 'development'

# require all gems in the gemfile
Bundler.require(:default, env)

