# frozen_string_literal: true

# Videos from Wordpress
class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :url

      t.timestamps
    end
  end
end
