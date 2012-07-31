class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :description
      t.string :summary
      t.has_attached_file :background
      t.string :link
      
      t.timestamps
    end
  end
end
