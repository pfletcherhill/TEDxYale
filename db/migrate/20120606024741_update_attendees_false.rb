class UpdateAttendeesFalse < ActiveRecord::Migration
  def change
    change_table :attendees do |t|
      t.remove :checked_in
      t.boolean :checked_in, :default => false
    end
  end
end
