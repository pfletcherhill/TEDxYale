class CreatePosts < ActiveRecord::Migration
  def change
    drop_table :entries
    
    create_table :posts do |t|
      t.string :title
      t.text :body
      
      t.timestamps
    end
  end
end
