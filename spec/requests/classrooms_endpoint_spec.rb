require 'spec_helper'

RSpec.describe 'Classrooms endpoint' do
  describe 'post' do
    context '/api/v1/classrooms' do
      it 'should create an course' do
        params = { name: 'ADS1', shift: 0, year: 2017 }

        post '/api/classrooms', params

        expect(last_response.status).to eq 201
      end
    end

    context '/api/classrooms/:classroom_id/courses/add' do
      it 'should vinculate an course with an classroom' do
        course    = create(:course)
        classroom = create(:classroom)


        post "/api/classrooms/#{classroom.id}/courses/add", { course_ids: [ course.id ] }

        expect(last_response.status).to eq 201
        expect(ClassroomCourse.count).to eq 1
      end
    end
  end
end
