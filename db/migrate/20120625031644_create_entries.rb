class CreateEntries < ActiveRecord::Migration
  def change
    drop_table :wikis
    
    create_table :entries do |t|
      t.string :title
      t.text :body
      
      t.timestamps
    end
  end
end
