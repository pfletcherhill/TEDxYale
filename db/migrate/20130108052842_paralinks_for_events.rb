class ParalinksForEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.string :paralink
    end
  end
end
