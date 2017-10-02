class Courses < Endpoint
  namespace :courses do
    desc 'returns all courses'
    get '/' do
      Course.all
    end

    params do
      requires :name, type: String, desc: 'Name'
      requires :description, type: String, desc: 'Description'
    end

    desc 'creates a course'
    post '/' do
      Course.create(declared(params))
    end

    desc 'find an specific course by id'
    get ':id' do
      Course.find(params[:id])
    end

    params do
      requires :id, type: Integer
      requires :description, type: String
      requires :name, type: String
    end

    desc 'update an specific an coures'
    put ':id' do
      course = Course.find(params[:id])
      course.update(declared(params))
      course
    end

    desc 'destroy an course'
    delete ':id' do
      course = Course.find(params[:id])
      course.destroy
    end
  end
end
