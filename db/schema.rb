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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_19_044107) do

  create_table "exam_places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "facility_name", null: false
    t.string "address", null: false
    t.text "map_image"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "exam_place_id"
    t.date "date", null: false
    t.integer "type", null: false
    t.date "announcement_date"
    t.text "gg_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_place_id"], name: "index_exams_on_exam_place_id"
  end

  create_table "friendships", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_user_id"
    t.index ["friend_user_id", "user_id"], name: "index_friendships_on_friend_user_id_and_user_id", unique: true
    t.index ["user_id", "friend_user_id"], name: "index_friendships_on_user_id_and_friend_user_id", unique: true
  end

  create_table "holidays", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_holidays_on_user_id"
  end

  create_table "lesson_places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "facility_name", null: false
    t.string "address", null: false
    t.text "map_image"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_name"], name: "index_lesson_places_on_facility_name"
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lesson_place_id"
    t.integer "type", null: false
    t.date "date", null: false
    t.text "gg_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_place_id"], name: "index_lessons_on_lesson_place_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "user_owned_exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "exam_id", null: false
    t.integer "payment_confirmation"
    t.integer "re_exam_status"
    t.integer "shintaikensa_status"
    t.integer "exam_ticket"
    t.integer "text_book"
    t.integer "exam_number"
    t.integer "pass_or_fail"
    t.integer "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_user_owned_exams_on_exam_id"
    t.index ["user_id"], name: "index_user_owned_exams_on_user_id"
  end

  create_table "user_owned_lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.integer "payment_confirmation"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_user_owned_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_user_owned_lessons_on_user_id"
  end

  create_table "user_teaching_lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_user_teaching_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_user_teaching_lessons_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "name_furigana"
    t.string "former_name"
    t.string "former_name_furigana"
    t.integer "gender"
    t.date "birth"
    t.string "nationality"
    t.string "permanent_address"
    t.string "former_permanent_address"
    t.integer "license_number"
    t.date "license_expiration_date"
    t.integer "license_status"
    t.integer "phone_number"
    t.integer "phone_number2"
    t.integer "postal_code"
    t.string "address"
    t.integer "postal_code2"
    t.string "address2"
    t.integer "admin"
    t.integer "teacher"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["name_furigana"], name: "index_users_on_name_furigana"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
