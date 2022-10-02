class AddRecipeToBody < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :body, :string
  end
end
