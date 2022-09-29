class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.timestamps
      t.integer :genre_id
      t.integer :user_id
      t.string :recipe_name
      
    end
  end
end
