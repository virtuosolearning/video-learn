class CreateLessonViewTable < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_views do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
