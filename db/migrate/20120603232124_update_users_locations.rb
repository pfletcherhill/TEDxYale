class UpdateUsersLocations < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.string :location_address
      t.string :location_city
      t.string :location_state
      t.integer :location_zipcode
    end
    change_table :users do |t|
      t.remove :location_address
      t.remove :location_city
      t.remove :location_state
      t.remove :location_zipcode
    end
  end
end
