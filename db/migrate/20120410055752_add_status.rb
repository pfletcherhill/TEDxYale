class AddStatus < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  	  t.boolean :statusr
  	end
  end
end
