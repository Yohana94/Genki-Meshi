class AddAmountToMyemosIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :mymemos_ingredients, :amount, :integer
    remove_column :mymemos, :amount, :integer
    remove_column :ingredients, :amount, :integer
  end
end
