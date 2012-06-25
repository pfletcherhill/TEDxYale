class CreateUsers < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :checked_in, :default => false
      
      t.timestamps
    end

    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :location_url
      t.string :image
      t.string :location_address
      t.string :location_city
      t.string :location_state
      t.string :location_zipcode
      t.boolean :published, :default => false
      t.has_attached_file :header
      t.has_attached_file :thumbnail
      t.datetime :datetime
      t.string :sort
      
      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.text :body
      
      t.timestamps
    end

    create_table :presenters do |t|
      t.integer :speaker_id
      t.integer :event_id
      
      t.timestamps
    end

    create_table :speakers do |t|
      t.string :name
      t.text :bio
      t.has_attached_file :thumbnail
      t.string :twitter
      
      t.timestamps
    end

    create_table :subscriptions do |t|
      t.string :name
      t.string :email
      
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :affiliation
      t.string :admin, :limit => 1
      t.string :year
      
      t.timestamps
    end
  end
end
