# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130128013133) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "summary"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
    t.string   "link"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "applicants", :force => true do |t|
    t.string   "team"
    t.string   "name"
    t.string   "email"
    t.string   "year"
    t.text     "bio"
    t.text     "ted_talk"
    t.string   "speaker"
    t.text     "question"
    t.text     "experience"
    t.boolean  "facebook"
    t.boolean  "twitter"
    t.boolean  "tumblr"
    t.boolean  "google"
    t.boolean  "final_cut"
    t.boolean  "photoshop"
    t.boolean  "lights"
    t.boolean  "sound"
    t.boolean  "video"
    t.boolean  "html"
    t.boolean  "css"
    t.boolean  "jquery"
    t.boolean  "javascript"
    t.boolean  "ror"
    t.boolean  "in_design"
    t.boolean  "illustrator"
    t.boolean  "exec"
    t.boolean  "social_media_director"
    t.boolean  "marketing_director"
    t.boolean  "social_director"
    t.boolean  "developer"
    t.boolean  "designer"
    t.boolean  "conference_director"
    t.boolean  "salons_director"
    t.boolean  "speakers_director"
    t.boolean  "finance_director"
    t.boolean  "fundraising_director"
    t.boolean  "stage_manager"
    t.boolean  "set_designer"
    t.boolean  "lights_sound_director"
    t.boolean  "video_director"
    t.boolean  "photographer"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "affiliation"
    t.string   "year"
    t.text     "bio"
    t.boolean  "events_team"
    t.boolean  "finance_team"
    t.boolean  "community_team"
    t.text     "experiences"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "attendees", :force => true do |t|
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "checked_in", :default => false
  end

  create_table "codes", :force => true do |t|
    t.string   "code"
    t.integer  "uses"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.string   "location_url"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.datetime "datetime"
    t.string   "image"
    t.string   "location_address"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zipcode"
    t.boolean  "published",              :default => false
    t.string   "sort"
    t.string   "header_file_name"
    t.string   "header_content_type"
    t.integer  "header_file_size"
    t.datetime "header_updated_at"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.string   "paralink"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "speakers", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "twitter"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.integer  "event_id"
    t.string   "email"
    t.string   "college"
    t.string   "year"
    t.string   "password_salt"
    t.string   "password_hash"
    t.string   "talk_title"
    t.text     "talk_about"
    t.text     "short_bio"
    t.boolean  "release_form"
    t.datetime "release_date"
    t.string   "coming_from"
    t.string   "transportation"
    t.string   "arrival"
    t.string   "housing"
    t.string   "post_event"
    t.text     "diet"
    t.text     "guest"
    t.text     "status"
    t.text     "scheduling"
    t.string   "website"
    t.string   "time_limit"
    t.string   "announcement_video"
    t.string   "slideshow"
    t.boolean  "public"
    t.string   "crop"
  end

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "sponsorships", :force => true do |t|
    t.integer  "amount"
    t.integer  "event_id"
    t.integer  "sponsor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "primary"
  end

  create_table "student_speakers", :force => true do |t|
    t.string   "name"
    t.string   "talk"
    t.string   "description"
    t.string   "youtube"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "amount"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "affiliation"
    t.string   "admin",         :limit => 1
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "year"
    t.string   "twitter"
    t.string   "tedtalk"
    t.string   "code"
    t.boolean  "has_access"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "speaker"
    t.text     "description"
    t.string   "affiliation"
    t.string   "event"
    t.string   "event_link"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "link"
    t.string   "still_file_name"
    t.string   "still_content_type"
    t.integer  "still_file_size"
    t.datetime "still_updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "student_speaker_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
