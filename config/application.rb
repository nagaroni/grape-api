require_relative 'boot'

class Application < Grape::API
  def self.initialize!
    _mount_resources
    self
  end

  def self.root
    @@root ||= File.expand_path('../.', __dir__)
  end

  private

  def self._mount_resources
    Dir["#{root}/app/endpoints/**/*.rb"].each do |filename|
      klass = filename.gsub(/(#{root}\/app\/endpoints\/|\.rb)/, '')

      mount klass.camelcase.constantize
    end
  end
end
