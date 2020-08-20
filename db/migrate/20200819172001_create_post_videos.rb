class CreatePostVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :post_videos do |t|
      t.references :post, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
