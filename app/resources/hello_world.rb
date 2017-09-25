module Resources
  class HelloWorld < Grape::API
    format :json

    get '/' do
      'hello world'
    end
  end
end
