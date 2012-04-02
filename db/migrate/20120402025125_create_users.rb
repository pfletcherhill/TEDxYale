class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :team
	  t.string :name
	  t.string :email
	  t.string :year
	  t.text :bio
	  t.text :ted_talk
	  t.string :speaker
	  t.text :question
	  t.text :experience
	  t.boolean :facebook
	  t.boolean :twitter
	  t.boolean :tumblr
	  t.boolean :google
	  t.boolean :final_cut
	  t.boolean :photoshop
	  t.boolean :lights
	  t.boolean :sound
	  t.boolean :video
	  t.boolean :html
	  t.boolean :css
	  t.boolean :jquery
	  t.boolean :javascript
	  t.boolean :ror
	  t.boolean :in_design
	  t.boolean :illustrator
	  t.boolean :exec
	  t.boolean :social_media_director
	  t.boolean :marketing_director
	  t.boolean :social_director
	  t.boolean :developer
	  t.boolean :designer
	  t.boolean :conference_director
	  t.boolean :salons_director
	  t.boolean :speakers_director
	  t.boolean :finance_director
	  t.boolean :fundraising_director
	  t.boolean :stage_manager
	  t.boolean :set_designer
	  t.boolean :lights_sound_director
	  t.boolean :video_director
	  t.boolean :photographer
	  
      t.timestamps
    end
    
    create_table :admins do |t|
      t.string :email
      t.string :name
      t.string :password_hash
      t.string :password_salt
      
      t.timestamps
    end
  end
end
