class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :video_link
      t.boolean :is_powerpoint, default: false
      t.boolean :is_excel, default: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
