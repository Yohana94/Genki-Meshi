class CreateMymemosIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :mymemos_ingredients do |t|
      t.integer :mymemo_id
      t.integer :ingredient_id
      t.timestamps
    end
  end
end
