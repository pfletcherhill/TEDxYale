class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :user_id
      t.string :event_id
      
      t.timestamps
    end
  end
end
