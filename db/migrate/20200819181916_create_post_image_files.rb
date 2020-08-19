class CreatePostImageFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :post_image_files do |t|
      t.references :post, null: false, foreign_key: true
      t.references :image_file, null: false, foreign_key: true

      t.timestamps
    end
  end
end
