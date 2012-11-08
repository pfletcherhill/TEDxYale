class TalkTitles < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.string :talk_title
      t.text :talk_about
    end
  end
end
