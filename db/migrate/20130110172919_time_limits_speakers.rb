class TimeLimitsSpeakers < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.string :time_limit
    end
  end
end
