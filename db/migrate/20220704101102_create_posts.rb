class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.datetime :date
      t.string :meal_content
      t.string :meal_content_image
      t.text :training_content
      t.float :weight
      t.timestamps
    end
  end
end
