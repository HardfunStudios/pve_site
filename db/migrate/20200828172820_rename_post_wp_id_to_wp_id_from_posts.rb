# frozen_string_literal: true

# Renaming column to generic name
class RenamePostWpIdToWpIdFromPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :post_wp_id, :wp_id
  end
end
