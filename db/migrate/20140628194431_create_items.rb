class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :text
      t.references :board, index: true
      t.integer :x_position
      t.integer :y_position
      t.integer :width
      t.integer :height
      t.string :kind
    end
  end
end
