class AddEndDateToApplicationCycle < ActiveRecord::Migration
  def change
    change_table :application_cycles do |t|
      t.datetime :end_date
    end
  end
end
