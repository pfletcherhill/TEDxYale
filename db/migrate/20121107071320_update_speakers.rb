class UpdateSpeakers < ActiveRecord::Migration
  def change
    change_table :speakers do |t| 
      t.string :email
      t.string :college
      t.string :year
      t.string :password_salt
      t.string :password_hash
    end
  end
end
