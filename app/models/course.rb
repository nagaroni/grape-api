class Course < ApplicationRecord
  has_many :classroom_courses
  has_many :classrooms, through: :classroom_courses
  has_many :assessments, as: :assessmentable
  has_many :lessons
  accepts_nested_attributes_for :assessments
end
