class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :size
      t.integer :sort
      t.float :price
      t.string :unit
      t.string :img

      t.timestamps
    end
  end
end
