class UpdatePublished < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :published
      t.boolean :published, :default => false
    end
  end
end
