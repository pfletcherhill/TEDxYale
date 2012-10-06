class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.text :description
      t.has_attached_file :thumbnail
      
      t.timestamps
    end
  end
end
