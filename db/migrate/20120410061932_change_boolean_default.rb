class ChangeBooleanDefault < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :status
      t.boolean :status, :default => false
    end
  end
end
