class AccessTocken < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :has_access
    end
  end
end
