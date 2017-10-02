require './lib/connection_management'

module App
  module Helpers
    def app
      app = Application.initialize!
      ConnectionManagement.new(app)
    end
  end
end
