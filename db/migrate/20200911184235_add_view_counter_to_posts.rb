class AddViewCounterToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :view_counter, :integer, default: 0
  end
end
