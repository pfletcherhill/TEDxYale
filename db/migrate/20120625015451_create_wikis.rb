class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.text :body
      t.string :title
      
      t.timestamps
    end
  end
end
