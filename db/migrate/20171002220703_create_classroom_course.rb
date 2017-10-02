class CreateClassroomCourse < ActiveRecord::Migration[5.1]
  def change
    create_table :classroom_courses do |t|
      t.references :classroom, foreign_key: true
      t.references :course, foreign_key: true
    end
  end
end
