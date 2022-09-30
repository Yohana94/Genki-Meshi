class CreateMyMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :my_memos do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
