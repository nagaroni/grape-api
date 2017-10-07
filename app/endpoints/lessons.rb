class Lessons < Endpoint
  namespace :courses do
    route_param :course_id do
      namespace :lessons do
        params do
          requires :title, type: String
          requires :content, type: String
          requires :video_uri, type: String
        end

        post '/' do
          LessonsCreator.new(params[:course_id], declared(params)).create
        end
      end
    end
  end
end
