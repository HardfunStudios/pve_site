# frozen_string_literal: true

# Attached files from content
class CreateAttachedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :attached_files do |t|
      t.string :origin_url
      t.string :local_url
      t.string :file_type

      t.timestamps
    end
  end
end
