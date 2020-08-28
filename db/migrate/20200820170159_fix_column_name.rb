# frozen_string_literal: true

# DERP
class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :post_nama, :post_name
  end
end
