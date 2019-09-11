class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.bigint "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end
    create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.bigint "byte_size", null: false
      t.string "checksum", null: false
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end
    create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "prefecture_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "address_last_name", null: false
      t.string "address_first_name", null: false
      t.string "address_last_name_kana", null: false
      t.string "address_first_name_kana", null: false
      t.string "address_number", null: false
      t.string "address_city", null: false
      t.string "address_block", null: false
      t.string "address_building"
      t.string "address_phone_number"
      t.integer "user_id"
    end
    create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.string "customer_id", null: false
      t.string "card_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_cards_on_user_id"
    end
    create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name", null: false
      t.integer "price", null: false
      t.integer "saler_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.text "description"
      t.integer "brand_id"
      t.string "size"
      t.integer "buyer_id"
      t.text "image"
      t.text "postage"
      t.text "category_id"
      t.text "condition"
      t.text "deliver_date"
      t.string "prefecture_id"
    end
    create_table "personals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "p_address_number"
      t.integer "p_address_prefecture", default: 0
      t.string "p_address_city"
      t.string "p_address_block"
      t.string "p_address_building"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "sns_credentials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "user_id"
      t.string "uid"
      t.string "provider"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "nickname", null: false
      t.text "profile"
      t.string "last_name", null: false
      t.string "first_name", null: false
      t.string "last_name_kana", null: false
      t.string "first_name_kana", null: false
      t.integer "birthdate_year", null: false
      t.integer "birthdate_month", null: false
      t.integer "birthdate_day", null: false
      t.string "phone_number", null: false
      t.string "provider"
      t.string "uid"
      t.string "image"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
    add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
    add_foreign_key "cards", "users"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
