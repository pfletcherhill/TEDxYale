class VideoAnnouncement < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.string :announcement_video
      t.string :slideshow
    end
  end
end
