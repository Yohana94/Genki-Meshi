class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.timestamps
      t.integer :genre_id
      t.integer :user_id
      t.string :recipe_name
      t.text :body
      t.integer :admin_id
      t.integer :ingredient_id
      t.string :nutrition
      t.string :ingredient_name
      t.string  :composition
    end
  end
end
