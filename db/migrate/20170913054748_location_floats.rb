class LocationFloats < ActiveRecord::Migration[5.1]
  def change
  remove_column :locations, :longitude
  remove_column :locations, :latitude
  add_column :locations, :longitude, :float
  add_column :locations, :latitude, :float
  end
end
