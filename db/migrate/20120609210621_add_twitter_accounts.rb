class AddTwitterAccounts < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.string :twitter
    end
  end
end
