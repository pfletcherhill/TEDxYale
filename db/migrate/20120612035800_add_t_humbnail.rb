class AddTHumbnail < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.has_attached_file :header
      t.has_attached_file :thumbnail
    end
  end
end
