class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, null: :false, polymorphic: true
      t.references :user
      t.references :parent
      t.text :body, null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end