#!/user/bin/rake

require 'active_record_migrations'

env = ENV['GRAPE_ENV'] || 'development'
database_config = YAML.load_file('./config/database.yml')

ActiveRecordMigrations.configure do |config|
  config.database_configuration = database_config
  config.environment = env
  config.db_dir = 'db'
  config.migrations_paths = ['db/migrate']
end

ActiveRecordMigrations.load_tasks
