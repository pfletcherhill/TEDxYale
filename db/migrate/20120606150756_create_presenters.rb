class CreatePresenters < ActiveRecord::Migration
  def change
    create_table :presenters do |t|
      t.integer :speaker_id
      t.integer :event_id
      
      t.timestamps
    end
  end
end
