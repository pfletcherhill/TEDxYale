class UpdateEvetns < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.datetime :datetime
      t.string :image
    end
  end
end
