class Classroom < ApplicationRecord
  has_many :classroom_courses
  has_many :courses, through: :classroom_courses
end
