class EditUsersForLists < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :list_id
    end
  end
end
