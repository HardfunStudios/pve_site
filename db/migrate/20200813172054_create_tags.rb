# frozen_string_literal: true

# Tags from Wordpress
class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.integer :term_wp_id
      t.string :name
      t.string :slug
      t.integer :term_group
      t.integer :term_taxonomy_id
      t.string :taxonomy
      t.string :description
      t.integer :parent_wp_id
      t.integer :count
      t.string :filter
      t.references :parent, foreign_key: { to_table: :tags }

      t.timestamps
    end
  end
end
