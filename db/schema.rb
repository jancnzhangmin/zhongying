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

ActiveRecord::Schema.define(version: 2018_11_07_071927) do

  create_table "appoints", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "intention_id"
    t.bigint "user_id"
    t.bigint "appointtp_id"
    t.datetime "appointtime"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointtps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "appointtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chinadistricts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customerappoints", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "user_id"
    t.bigint "appointtp_id"
    t.datetime "appointtime"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "commpany"
    t.string "contact"
    t.string "contactphone"
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "address"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "industrie_id"
    t.bigint "customertype_id"
    t.datetime "entertime"
  end

  create_table "customertypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "industrie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intentions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "commpany"
    t.string "contact"
    t.string "contactphone"
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "address"
    t.text "summary"
    t.integer "transcustomer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "industrie_id"
  end

  create_table "pacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "pacttype_id"
    t.string "name"
    t.datetime "signtime"
    t.datetime "begintime"
    t.datetime "endtime"
    t.string "pactnumber"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacttypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "pacttype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productdefs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "unit"
    t.text "summary"
    t.integer "overdue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "productdef_id"
    t.float "price"
    t.float "number"
    t.datetime "overdue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transcustomers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "intention_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "openid"
    t.string "unionid"
    t.string "headurl"
    t.string "login"
    t.string "password_digest"
    t.integer "wxauth"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
  end

end
