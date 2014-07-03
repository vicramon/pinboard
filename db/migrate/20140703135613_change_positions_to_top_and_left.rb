class ChangePositionsToTopAndLeft < ActiveRecord::Migration
  def change
    rename_column :items, :x_position, :left
    rename_column :items, :y_position, :top
  end
end
