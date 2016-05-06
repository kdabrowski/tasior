class CreateGeoPoints < ActiveRecord::Migration
  def change
    create_table :geo_points do |t|
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
