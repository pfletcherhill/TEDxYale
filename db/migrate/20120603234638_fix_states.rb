class FixStates < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :location_zipcode
      t.string :location_zipcode
    end
  end
end
