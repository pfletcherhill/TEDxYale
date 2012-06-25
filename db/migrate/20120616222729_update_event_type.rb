class UpdateEventType < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :type
      t.string :type
    end
  end
end
