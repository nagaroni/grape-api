module Resources
  class Courses < Grape::API
    get '/' do
      'hello world'
    end
  end
end
