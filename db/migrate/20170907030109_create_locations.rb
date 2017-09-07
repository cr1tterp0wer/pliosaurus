class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.integer :user_id, null:false
      t.timestamps
    end
    add_index :locations, :user_id
  end
end
