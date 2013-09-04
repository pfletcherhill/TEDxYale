class CreateApplicationCycles < ActiveRecord::Migration
  def change
    create_table :application_cycles do |t|
      t.string :name
      t.text :description
      
      t.timestamps
    end
    
    change_table :applications do |t|
      t.integer :application_cycle_id
    end
  end
end
