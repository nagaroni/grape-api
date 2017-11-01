class Endpoint < Grape::API
  format :json
  prefix :api

  formatter :json, Grape::Formatter::Roar
end
