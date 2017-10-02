class CreateClassroom < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :shift
      t.integer :year
    end
  end
end
