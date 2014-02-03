class AddFacebookAuthentication < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :uid
    end
  end
end
