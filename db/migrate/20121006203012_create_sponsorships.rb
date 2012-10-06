class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.integer :amount
      t.boolean :primary?
      t.integer :event_id
      t.integer :sponsor_id
      
      t.timestamps
    end
  end
end
