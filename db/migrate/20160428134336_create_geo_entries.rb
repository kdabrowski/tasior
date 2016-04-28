class CreateGeoEntries < ActiveRecord::Migration
  def change
    create_table :geo_entries do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
