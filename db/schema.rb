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

ActiveRecord::Schema.define(:version => 20130203172602) do

  create_table "degrees", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "university_id"
    t.string   "type_of_degree"
    t.string   "primary_focus"
    t.string   "secondary_focus"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "degrees", ["profile_id"], :name => "index_degrees_on_profile_id"
  add_index "degrees", ["university_id"], :name => "index_degrees_on_university_id"

  create_table "jobs", :force => true do |t|
    t.string   "organization"
    t.string   "position"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_current"
    t.integer  "profile_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "jobs", ["profile_id"], :name => "index_jobs_on_profile_id"

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_public"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.boolean  "is_approved"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "posts", ["topic_id"], :name => "index_posts_on_topic_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "conflict"
    t.text     "about_me"
    t.string   "blog_url"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "avatar"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "resources", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.integer  "read_count"
    t.integer  "votes"
    t.boolean  "is_approved"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "resources", ["topic_id"], :name => "index_resources_on_topic_id"
  add_index "resources", ["user_id"], :name => "index_resources_on_user_id"

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.boolean  "is_approved"
    t.boolean  "is_featured"
    t.integer  "last_poster_id"
    t.datetime "last_post_at"
    t.integer  "user_id"
    t.integer  "network_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "content"
  end

  add_index "topics", ["network_id"], :name => "index_topics_on_network_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.string   "abbreviated_name"
    t.integer  "zipcode"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
