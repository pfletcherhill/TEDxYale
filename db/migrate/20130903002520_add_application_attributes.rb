class AddApplicationAttributes < ActiveRecord::Migration
  def change
    change_table :applications do |t|
      t.string :major
      t.string :hometown
    end
    
    change_table :application_cycles do |t|
      t.string :slug
    end
  end
end
