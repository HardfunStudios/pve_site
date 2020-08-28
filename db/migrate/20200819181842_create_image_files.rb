# frozen_string_literal: true

# Images from content
class CreateImageFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :image_files do |t|
      t.string :origin_url
      t.string :local_url

      t.timestamps
    end
  end
end
