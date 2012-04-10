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

ActiveRecord::Schema.define(:version => 20120410061932) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
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
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "status",                :default => false
  end

end
