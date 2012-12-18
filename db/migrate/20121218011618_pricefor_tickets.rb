class PriceforTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.string :amount
    end
  end
end
