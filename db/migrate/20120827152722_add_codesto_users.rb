class AddCodestoUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :code
    end
  end
end
