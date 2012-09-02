class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.string :affiliation
      t.string :year
      t.text :bio
      t.boolean :events_team
      t.boolean :finance_team
      t.boolean :community_team
      t.text :experiences
      
      t.timestamps
    end
  end
end
