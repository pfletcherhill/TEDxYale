class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :speaker
      t.text :description
      t.string :affiliation
      t.string :event
      t.string :event_link
      
      t.timestamps
    end
    change_table :speakers do |t|
      t.integer :event_id
    end
    drop_table :presenters
  end
end
