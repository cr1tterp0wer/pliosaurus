class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string  :title, null:false, uniqueness:true 
      t.integer :user_id
      t.timestamps
    end
  end
end
