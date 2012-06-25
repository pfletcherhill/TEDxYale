class RemovingTypeFromEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :type
      t.string :sort
    end
  end
end
