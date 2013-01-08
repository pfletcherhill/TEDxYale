class AddWebsiteToSpeaker < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.string :website
    end
  end
end
