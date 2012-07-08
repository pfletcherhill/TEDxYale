class AddLink < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.string :link
      t.has_attached_file :still
    end
  end
end
