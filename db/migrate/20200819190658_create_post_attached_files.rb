# frozen_string_literal: true

# Relation between posts and attached files
class CreatePostAttachedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :post_attached_files do |t|
      t.references :post, null: false, foreign_key: true
      t.references :attached_file, null: false, foreign_key: true

      t.timestamps
    end
  end
end
