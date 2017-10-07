class Course < ApplicationRecord
  has_many :classroom_courses
  has_many :coures, through: :classroom_courses
end
