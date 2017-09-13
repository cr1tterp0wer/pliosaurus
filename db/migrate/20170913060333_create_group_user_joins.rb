class CreateGroupUserJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :group_user_joins do |t|
      t.integer :user_id, null:false
      t.integer :group_id, null:false
      t.timestamps
    end
    add_index :group_user_joins, :user_id
    add_index :group_user_joins, :group_id
  end
end
