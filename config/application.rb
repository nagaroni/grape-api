require_relative 'boot'

class Array
  alias each_value each
end

class Application < Grape::API
  def initialize
    @_autoloads = Dir['app/resources/**/*.rb']

    _configure_application
  end

  def self.initialize!
    @@instance = self.new

    self.class
  end

  def self.root
    @@root ||= File.expand_path('../.', __dir__)
  end

  private

  def _mount_resources
    mount(Resources::Courses)
  end

  def eager_load!
    @_autoloads.each { |file| require "#{self.class.root}/#{file}" }
  end

  def _configure_application
    eager_load!

    _mount_resources
  end
end
