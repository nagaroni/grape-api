RSpec.describe 'Assessments endpoint' do
  context 'POST /courses/assessments' do
    describe 'creates an assessment to course itself' do
      it '' do
        course = create(:course)
        assessment_params = {
          assessments_attributes: { average_grade: 80.0 }
        }

        expect { post "/api/courses/#{course.id}/assessments", assessment_params }
          .to change { Assessment.count }.by(1)
        response = JSON.parse(last_response.body)

        expect(response["_links"]).to include({ "assessments" => Array })

      end
    end
  end
end
