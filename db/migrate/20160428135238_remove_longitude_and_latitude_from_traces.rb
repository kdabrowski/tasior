class RemoveLongitudeAndLatitudeFromTraces < ActiveRecord::Migration
  def change
    remove_column :traces, :longitude
    remove_column :traces, :latitude
  end
end
