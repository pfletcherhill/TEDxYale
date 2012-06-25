class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :location_url
      t.integer :type, :limit => 1
      
      t.timestamps
    end
  end
end
