class ConnectionManagement
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    test = env['rack.test']

    response = @app.call(env)
    response[2] = ::Rack::BodyProxy.new(response[2]) do
      ActiveRecord::Base.clear_active_connections! unless test
    end
    response
  rescue Exception
    ActiveRecord::Base.clear_active_connections! unless test
    raise
  end
end
