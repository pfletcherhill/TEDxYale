class RevampingDatabases < ActiveRecord::Migration
  def change
    drop_table :users
    drop_table :subscriptions
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :affiliation
      t.integer :year, :limit => 4
      t.string :admin, :limit => 1
      
      t.timestamps
    end
  end
end
