class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :post_author
      t.datetime :post_date_gmt
      t.text :post_content
      t.string :post_title
      t.string :post_status
      t.text :post_excerpt
      t.string :comment_status
      t.string :ping_status
      t.string :post_nama
      t.datetime :post_modified
      t.datetime :post_modified_gmt
      t.string :post_content_filtered
      t.integer :post_parent
      t.integer :post_wp_id
      t.integer :menu_order
      t.string :guid
      t.string :post_type
      t.string :post_mime_type
      t.integer :comment_count
      t.string :filter
      t.json :post_meta
      t.string :post_thumbnail

      t.timestamps
    end
  end
end
