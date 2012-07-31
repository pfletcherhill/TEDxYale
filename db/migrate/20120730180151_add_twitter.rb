class AddTwitter < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :twitter
    end
  end
end
