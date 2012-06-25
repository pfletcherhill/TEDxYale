class ChangeAttendeestoIntegers < ActiveRecord::Migration
  def change
    change_table :attendees do |t|
      t.remove :user_id
      t.remove :event_id
      t.integer :user_id
      t.integer :event_id
    end
  end
end
