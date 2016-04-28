class AddReferenceToGeoEntries < ActiveRecord::Migration
  def change
    add_reference :geo_entries, :trace, index: true, foreign_key: true
  end
end
