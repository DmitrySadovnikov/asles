class CreateJoinTableCategoriesProducts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :products do |t|
    end
  end
end
