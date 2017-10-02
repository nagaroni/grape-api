class ClassroomCourse < ApplicationRecord
  belongs_to :classroom
  belongs_to :course
end
