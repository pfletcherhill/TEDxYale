class FixSponsorships < ActiveRecord::Migration
  def change
    change_table :sponsorships do |t|
      t.remove :primary?
      t.boolean :primary
    end
  end
end
