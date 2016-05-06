class AddIndexOnLongitudeAndLatitudeForGeoPoins < ActiveRecord::Migration
  def change
    add_index :geo_points, [:latitude, :longitude]
  end
end
