class CreateMymemos < ActiveRecord::Migration[6.1]
  def change
    create_table :mymemos do |t|
      t.integer :ingredient_id
      t.integer :user_id
      t.integer :amount
      t.timestamps
    end
  end
end
