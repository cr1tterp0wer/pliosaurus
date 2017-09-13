class RemoveUseriDfromGroups < ActiveRecord::Migration[5.1]
  def change
  remove_column :groups, :user_id
  end
end
