class DropTableMyMemo < ActiveRecord::Migration[6.1]
  def change
    drop_table :my_memos
    remove_column :mymemos, :ingredient_id, :integer
  end
end
