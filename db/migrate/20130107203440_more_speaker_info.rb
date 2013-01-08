class MoreSpeakerInfo < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.string :coming_from
      t.string :transportation
      t.string :arrival
      t.string :housing
      t.string :post_event
      t.text :diet
      t.text :guest
      t.text :status
      t.text :scheduling
    end
  end
end
