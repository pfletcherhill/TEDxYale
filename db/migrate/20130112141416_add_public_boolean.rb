class AddPublicBoolean < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.boolean :public
    end
  end
end
