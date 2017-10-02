require 'spec_helper.rb'

RSpec.describe 'Cousers Endpoint' do
  describe 'get' do
    context '/api/v1/courses' do
      it 'should render all courses' do
        courses = Course.create(
          [{name: 'some course', description: 'some description'},
           {name: 'another course', description: 'another description'}]
        )

        get '/api/courses'

        expected = courses.map(&:serializable_hash)
        parsed_body = JSON.parse(last_response.body)

        expect(parsed_body).to match(expected)
      end
    end

    context '/courses/:id' do
      it 'should get an specific course' do
        course = Course
          .create(name: 'Empreendedorismo',
                  description: 'Curso sobre como se tornar um empreendedor.')

        get "/api/courses/#{course.id}"

        response = JSON.parse(last_response.body, symbolize_names: true)

        expect(response[:id]).to eq course.id
        expect(response[:name]).to eq course.name
        expect(response[:description]).to eq course.description
      end
    end
  end

  describe '#put' do
    context '/courses/:id' do
      it 'should update an course' do
        course = Course.create(name: 'Empreenderosmo', description: 'Curso Livre')

        params = { name: 'Empreendedorismo',
                   description: 'Curso sobre como se tornar um empreendedor de sucesso.' }

        put "/api/courses/#{course.id}", params

        response = JSON.parse(last_response.body, symbolize_names: true)

        expect(response[:name]).to eq params[:name]
        expect(response[:description]).to eq params[:description]
      end
    end
  end

  describe '#post' do
    context '/courses' do
      it 'should create a new course' do
        params =  { name: 'Algoritmos',
                    description: 'Estudo de algoritmos computacionais' }
        post '/api/courses', params

        response = JSON.parse(last_response.body, symbolize_names: true)

        expect(last_response.status).to eq 201
        expect(response[:name]).to eq params[:name]
        expect(response[:description]).to eq params[:description]
        expect(response[:id]).to match Integer
      end
    end
  end

  describe '#destroy' do
    context '/courses/:id' do
      it 'should delete an course' do
        course = Course.create(name: 'Java Begings', description: 'Learning by Tuto')

        delete "/api/courses/#{course.id}"

        expect(last_response.status).to eq 200
      end
    end
  end
end
