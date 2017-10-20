require 'spec_helper'

RSpec.describe 'lessons endpoint' do
  context 'post' do 
    describe '/api/courses/:course_id/lessons' do
      it 'should create an lesson' do
        course = create(:course)
        lesson_params = { title: 'Aula inicial', content: 'O que é?...', video_uri: 'http:://video.url.com' }

        post "/api/courses/#{course.id}/lessons", lesson_params

        expect(last_response.status).to eq 201
        expect(course.lessons.count).to eq 1
      end
    end
  end
end
