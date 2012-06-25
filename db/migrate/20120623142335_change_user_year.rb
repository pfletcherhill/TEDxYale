class ChangeUserYear < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :year
      t.string :year
    end
  end
end
