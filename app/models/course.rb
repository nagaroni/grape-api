class Course < ApplicationRecord
  has_many :classroom_courses
  has_many :classrooms, through: :classroom_courses
  has_many :lessons
end
