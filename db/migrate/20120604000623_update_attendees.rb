class UpdateAttendees < ActiveRecord::Migration
  def change
    change_table :attendees do |t|
      t.boolean :checked_in
    end
  end
end
