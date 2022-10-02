class AddRecipeToAdminId < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :admin_id, :interger
    add_column :recipes, :ingredient_id, :interger

  end
end
