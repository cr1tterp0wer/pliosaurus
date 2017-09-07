class Addlonglattolocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations,:longitude,:float
    add_column :locations,:latitude,:float
  end
end
