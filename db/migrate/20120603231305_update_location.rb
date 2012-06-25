class UpdateLocation < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :location_address
      t.string :location_city
      t.string :location_state
      t.integer :location_zipcode
    end
  end
end
