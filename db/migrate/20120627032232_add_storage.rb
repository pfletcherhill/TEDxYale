class AddStorage < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :header_file_name
      t.remove :header_content_type
      t.remove :header_file_size
      t.remove :header_updated_at
      t.remove :thumbnail_file_name
      t.remove :thumbnail_content_type
      t.remove :thumbnail_file_size
      t.remove :thumbnail_updated_at
      t.has_attached_file :header
      t.has_attached_file :thumbnail
    end
  end
end
