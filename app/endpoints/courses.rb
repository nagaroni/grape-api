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
      course = Course.find(params[:id])

      present course, with: CourseRepresenter
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
      present course, with: CourseRepresenter
    end

    desc 'destroy an course'
    delete ':id' do
      course = Course.find(params[:id])
      course.destroy
    end

    params do
      requires :id, type: Integer
      requires :assessments_attributes, type: Hash do
        requires :average_grade, type: Float
      end
    end

    desc 'creates an course assessment'
    post ':id/assessments' do
      declared_params = declared(params)
      course = Course.find(declared_params[:id])
      course
        .assessments
        .create(declared_params[:assessments_attributes])

      present course, with: CourseRepresenter
    end
  end
end
