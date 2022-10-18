class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.integer   :calorie
      t.string    :ingredient_name
      t.integer   :amount
      t.integer   :recipe_id
      t.integer   :mymemo_id
      t.timestamps
    end
  end
end
