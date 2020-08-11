class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :wp_id
      t.string  :title
      t.integer :author_id
      t.text    :content
      t.string  :slug
      t.text    :excerpt
      t.timestamps
    end
  end
end
