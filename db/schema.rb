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

ActiveRecord::Schema.define(version: 2018_12_03_082526) do

  create_table "boats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false
    t.date "announcement_date"
    t.text "gg_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "place_id"
    t.text "remark"
    t.string "siken_id"
    t.string "org_siken_id"
    t.integer "type_number", null: false
    t.index ["place_id"], name: "index_exams_on_place_id"
  end

  create_table "friendships", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_user_id"
    t.index ["friend_user_id", "user_id"], name: "index_friendships_on_friend_user_id_and_user_id", unique: true
    t.index ["user_id", "friend_user_id"], name: "index_friendships_on_user_id_and_friend_user_id", unique: true
  end

  create_table "gakka_passed_numbers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "siken_id"
    t.string "org_siken_id", null: false
    t.integer "type_number"
    t.string "exam_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_siken_id"], name: "index_gakka_passed_numbers_on_org_siken_id", unique: true
  end

  create_table "holidays", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_holidays_on_user_id"
  end

  create_table "jitugi_passed_numbers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "siken_id"
    t.string "org_siken_id", null: false
    t.integer "type_number"
    t.string "exam_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_siken_id"], name: "index_jitugi_passed_numbers_on_org_siken_id", unique: true
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false
    t.text "gg_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "place_id"
    t.text "remark"
    t.integer "type_number", null: false
    t.index ["place_id"], name: "index_lessons_on_place_id"
  end

  create_table "lessons_boats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "boat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_lessons_boats_on_boat_id"
    t.index ["lesson_id"], name: "index_lessons_boats_on_lesson_id"
  end

  create_table "places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "facility_name", null: false
    t.string "address", null: false
    t.text "map_image"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rx_lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "place_id"
    t.integer "type", null: false
    t.datetime "datetime", null: false
    t.text "gg_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_rx_lessons_on_place_id"
    t.index ["user_id"], name: "index_rx_lessons_on_user_id"
  end

  create_table "user_owned_exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "exam_id", null: false
    t.integer "payment_confirmation"
    t.integer "re_exam_status"
    t.integer "shintaikensa_status"
    t.integer "exam_ticket"
    t.integer "text_book"
    t.string "exam_number"
    t.integer "pass_or_fail"
    t.text "remark"
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

  create_table "user_owned_rx_lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "rx_lesson_id", null: false
    t.integer "renewal_or_expiration", null: false
    t.integer "payment_confirmation"
    t.integer "shintaikensa_status"
    t.string "reservation_number"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rx_lesson_id"], name: "index_user_owned_rx_lessons_on_rx_lesson_id"
    t.index ["user_id"], name: "index_user_owned_rx_lessons_on_user_id"
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
    t.string "license_number"
    t.date "license_expiration_date"
    t.integer "license_status"
    t.string "phone_number"
    t.string "phone_number2"
    t.string "postal_code"
    t.string "address"
    t.string "postal_code2"
    t.string "address2"
    t.integer "admin"
    t.integer "teacher"
    t.text "remark"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["name_furigana"], name: "index_users_on_name_furigana"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exams", "places"
  add_foreign_key "lessons", "places"
end
