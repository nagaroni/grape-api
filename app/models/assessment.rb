class Assessment < ApplicationRecord
  belongs_to :assessmentable, polymorphic: true
end
