class ChangeGeoTableTypeToText < ActiveRecord::Migration
  def change
    create_table :traces do |t|
      t.text :geo
    end
  end
end
