require 'spec_helper.rb'

RSpec.describe 'Salute endpoint' do
  context 'GET /' do
    it 'should render hello world' do
      get '/'

      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('hello world')
    end
  end
end
