class CreateTraces < ActiveRecord::Migration
  def change
    create_table :traces do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
