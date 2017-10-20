class CreateLesson < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.string :video_uri
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
