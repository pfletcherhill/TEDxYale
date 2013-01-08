class AddSpeakerInfo < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.text :short_bio
      t.boolean :release_form
      t.datetime :release_date
    end
  end
end
