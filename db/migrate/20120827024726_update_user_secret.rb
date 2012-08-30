class UpdateUserSecret < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :tedtalk
    end
  end
end
