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

ActiveRecord::Schema.define(version: 2018_09_13_190657) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "password"
    t.string "confirm_password"
    t.string "phone"
    t.string "phone1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "affectations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "agent_id"
    t.bigint "carrefour_id"
    t.string "fin"
    t.string "debut"
    t.string "token"
    t.string "status"
    t.index ["agent_id"], name: "index_affectations_on_agent_id"
    t.index ["carrefour_id"], name: "index_affectations_on_carrefour_id"
  end

  create_table "agents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "prenom"
    t.string "phone"
    t.string "matricule"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "commissariat_id"
    t.string "crypted"
    t.bigint "grade_id"
    t.bigint "ville_id"
    t.index ["commissariat_id"], name: "index_agents_on_commissariat_id"
    t.index ["grade_id"], name: "index_agents_on_grade_id"
    t.index ["ville_id"], name: "index_agents_on_ville_id"
  end

  create_table "alertes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titre"
    t.string "description"
    t.string "date"
    t.bigint "ville_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_id"
    t.bigint "agent_id"
    t.string "status"
    t.string "lieu"
    t.string "action"
    t.string "code"
    t.string "longitude"
    t.string "latitude"
    t.bigint "statu_id"
    t.string "archive"
    t.index ["agent_id"], name: "index_alertes_on_agent_id"
    t.index ["statu_id"], name: "index_alertes_on_statu_id"
    t.index ["type_id"], name: "index_alertes_on_type_id"
    t.index ["ville_id"], name: "index_alertes_on_ville_id"
  end

  create_table "assurances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_assurances_on_email", unique: true
    t.index ["reset_password_token"], name: "index_assurances_on_reset_password_token", unique: true
  end

  create_table "carrefours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "quartier"
    t.string "status"
    t.string "image"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ville_id"
    t.index ["ville_id"], name: "index_carrefours_on_ville_id"
  end

  create_table "commissariats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "ville_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "quartier"
    t.index ["ville_id"], name: "index_commissariats_on_ville_id"
  end

  create_table "constats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name1"
    t.string "name2"
    t.string "phone1"
    t.string "phone2"
    t.string "cni1"
    t.string "cni2"
    t.string "immatriculation1"
    t.string "immatriculation2"
    t.string "marque1"
    t.string "marque2"
    t.string "police1"
    t.string "police2"
    t.bigint "typeaccident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lieu"
    t.index ["typeaccident_id"], name: "index_constats_on_typeaccident_id"
  end

  create_table "contravetions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "token"
    t.string "motif"
    t.string "status"
    t.bigint "Agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "User_id"
    t.string "description"
    t.index ["Agent_id"], name: "index_contravetions_on_Agent_id"
    t.index ["User_id"], name: "index_contravetions_on_User_id"
  end

  create_table "convocations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cni"
    t.string "phone"
    t.string "name"
    t.string "prenom"
    t.string "immatriculation"
    t.string "residence"
    t.string "emploi"
    t.string "motif"
    t.string "observation"
    t.string "pieceretenue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ville"
    t.string "quartier"
    t.string "rue"
    t.string "sexe"
    t.bigint "agent_id"
    t.string "status"
    t.string "token"
    t.string "an"
    t.string "code"
    t.bigint "infraction_id"
    t.string "used"
    t.bigint "pieceretenu_id"
    t.index ["agent_id"], name: "index_convocations_on_agent_id"
    t.index ["infraction_id"], name: "index_convocations_on_infraction_id"
    t.index ["pieceretenu_id"], name: "index_convocations_on_pieceretenu_id"
  end

  create_table "convocations_infractions", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "convocation_id", null: false
    t.bigint "infraction_id", null: false
  end

  create_table "fylos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "prenom"
    t.string "phone"
    t.string "password"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "service"
    t.string "email"
    t.string "lastConnected"
    t.bigint "role_id"
    t.bigint "commissariat_id"
    t.string "matricule"
    t.index ["commissariat_id"], name: "index_fylos_on_commissariat_id"
    t.index ["role_id"], name: "index_fylos_on_role_id"
  end

  create_table "grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grvpcs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "password"
    t.string "password_confirmation"
    t.string "matricule"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_grvpcs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_grvpcs_on_reset_password_token", unique: true
  end

  create_table "infractions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "motif"
    t.string "montant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "browser"
    t.string "address"
    t.string "controller"
    t.string "action"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user"
    t.string "role"
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "matricule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.string "status"
    t.string "phone"
    t.string "phone1"
    t.string "phone2"
    t.string "code"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
    t.index ["service_id"], name: "index_members_on_service_id"
    t.index ["unlock_token"], name: "index_members_on_unlock_token", unique: true
  end

  create_table "metropolis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone"
    t.string "password"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_metropolis_on_email", unique: true
    t.index ["reset_password_token"], name: "index_metropolis_on_reset_password_token", unique: true
  end

  create_table "paiements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "montant"
    t.bigint "convocation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["convocation_id"], name: "index_paiements_on_convocation_id"
  end

  create_table "partenaires", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nom"
    t.string "phone"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieceretenus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_id"
    t.index ["type_id"], name: "index_services_on_type_id"
  end

  create_table "status", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typeaccidents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["service_id"], name: "index_types_on_service_id"
  end

  create_table "us", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
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
    t.index ["email"], name: "index_us_on_email", unique: true
    t.index ["name"], name: "index_us_on_name", unique: true
    t.index ["reset_password_token"], name: "index_us_on_reset_password_token", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "prenom"
    t.string "sexe"
    t.string "cartegrise"
    t.string "immatriculation"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "villes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "long"
    t.string "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

