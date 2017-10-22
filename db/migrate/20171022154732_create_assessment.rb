class CreateAssessment < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments do |t|
      t.references :assessmentable, polymorphic: true
      t.decimal :average_grade
    end
  end
end
