class AddEmailedBoolean < ActiveRecord::Migration
  def change
    change_table :applications do |t|
      t.boolean :emailed
    end
  end
end
