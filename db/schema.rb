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

ActiveRecord::Schema.define(:version => 20120625173247) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.string   "photo"
    t.string   "teacher_name"
    t.text     "biography_teacher"
    t.string   "place"
    t.text     "google_map"
    t.datetime "date_time"
    t.text     "requisites_student"
    t.integer  "price"
    t.string   "pay_link"
    t.integer  "limit_class_tickets"
    t.string   "facebook_link"
    t.boolean  "owned"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "token"
    t.integer  "course_id"
    t.string   "payment_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "quantity"
    t.integer  "total_price"
  end

  add_index "orders", ["course_id"], :name => "index_orders_on_course_id"

  add_foreign_key "orders", "courses", :name => "orders_course_id_fk"

end
