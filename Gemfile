source 'https://rubygems.org/'

gem 'grape', '~> 1.0'
gem 'puma', group: :production
gem 'activerecord', require: 'active_record'
gem 'active_record_migrations'
gem 'pg'

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'rack-test', require: 'rack/test'
  gem 'simplecov', require: false
end
