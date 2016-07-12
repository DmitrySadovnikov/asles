class CreateJoinTableMaterialsProducts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :materials, :products do |t|
    end
  end
end
