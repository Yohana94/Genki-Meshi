class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.integer   :calorie
      t.string    :ingredient_name
      t.timestamps
    end
  end
end
