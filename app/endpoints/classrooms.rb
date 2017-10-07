class Classrooms < Endpoint
  namespace :classrooms do
    params do
      requires :name, type: String
      requires :shift, type: Integer
      requires :year, type: Integer
    end

    post '/' do
      Classroom.create(declared(params))
    end

    params do
      requires :classroom_id, type: Integer
      requires :course_ids, type: Array[Integer]
    end

    post '/:classroom_id/courses/add' do
      ClassroomCourseCreator.new(params[:classroom_id], params[:course_ids]).create
    end
  end
end
