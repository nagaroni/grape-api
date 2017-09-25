module Resources
  class HelloWorld < Grape::API
    get '/' do
      'hello world'
    end
  end
end
