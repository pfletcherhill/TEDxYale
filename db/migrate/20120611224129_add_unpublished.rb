class AddUnpublished < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.boolean :published
    end
  end
end
