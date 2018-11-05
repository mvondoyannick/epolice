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

ActiveRecord::Schema.define(version: 2018_11_05_163141) do

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
    t.string "prenom"
    t.bigint "role_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_admins_on_role_id"
  end

  create_table "affectations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "agent_id"
    t.string "fin"
    t.string "debut"
    t.string "token"
    t.string "status"
    t.bigint "commissariat_id"
    t.bigint "postepolice_id"
    t.string "localisation"
    t.bigint "region_id"
    t.index ["agent_id"], name: "index_affectations_on_agent_id"
    t.index ["commissariat_id"], name: "index_affectations_on_commissariat_id"
    t.index ["postepolice_id"], name: "index_affectations_on_postepolice_id"
    t.index ["region_id"], name: "index_affectations_on_region_id"
  end

  create_table "agents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "prenom"
    t.string "phone"
    t.string "matricule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "commissariat_id"
    t.string "crypted"
    t.bigint "grade_id"
    t.string "age"
    t.string "sexe"
    t.bigint "region_id"
    t.string "statusaffectation"
    t.string "bloque"
    t.string "tokenagent"
    t.string "expire"
    t.boolean "statusdeleted"
    t.string "lastseenat"
    t.bigint "groupement_id"
    t.index ["commissariat_id"], name: "index_agents_on_commissariat_id"
    t.index ["grade_id"], name: "index_agents_on_grade_id"
    t.index ["groupement_id"], name: "index_agents_on_groupement_id"
    t.index ["region_id"], name: "index_agents_on_region_id"
  end

  create_table "alertes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titre"
    t.string "description"
    t.string "date"
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
    t.bigint "region_id"
    t.string "photo"
    t.index ["agent_id"], name: "index_alertes_on_agent_id"
    t.index ["region_id"], name: "index_alertes_on_region_id"
    t.index ["statu_id"], name: "index_alertes_on_statu_id"
    t.index ["type_id"], name: "index_alertes_on_type_id"
  end

  create_table "arrondissements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.bigint "departement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departement_id"], name: "index_arrondissements_on_departement_id"
    t.index ["region_id"], name: "index_arrondissements_on_region_id"
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

  create_table "bulletins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "order"
    t.string "debut"
    t.string "fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "localisation"
    t.bigint "commissariat_id"
    t.index ["commissariat_id"], name: "index_bulletins_on_commissariat_id"
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

  create_table "centrepartenaires", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "structure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.bigint "departement_id"
    t.bigint "arrondissement_id"
    t.string "localisation"
    t.string "nom"
    t.string "prenom"
    t.string "fonction"
    t.string "phone"
    t.string "email"
    t.index ["arrondissement_id"], name: "index_centrepartenaires_on_arrondissement_id"
    t.index ["departement_id"], name: "index_centrepartenaires_on_departement_id"
    t.index ["region_id"], name: "index_centrepartenaires_on_region_id"
    t.index ["structure_id"], name: "index_centrepartenaires_on_structure_id"
  end

  create_table "centrerecouvrements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "localisation"
    t.index ["region_id"], name: "index_centrerecouvrements_on_region_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "alerte_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "publisher"
    t.index ["alerte_id"], name: "index_comments_on_alerte_id"
  end

  create_table "commissariats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.bigint "departement_id"
    t.bigint "arrondissement_id"
    t.string "email"
    t.string "localisation"
    t.index ["arrondissement_id"], name: "index_commissariats_on_arrondissement_id"
    t.index ["departement_id"], name: "index_commissariats_on_departement_id"
    t.index ["region_id"], name: "index_commissariats_on_region_id"
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
    t.bigint "agent_id"
    t.string "comment"
    t.string "latitude"
    t.string "longitude"
    t.index ["agent_id"], name: "index_constats_on_agent_id"
    t.index ["typeaccident_id"], name: "index_constats_on_typeaccident_id"
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
    t.string "submit"
    t.string "transmittedby"
    t.string "buy"
    t.index ["agent_id"], name: "index_convocations_on_agent_id"
    t.index ["infraction_id"], name: "index_convocations_on_infraction_id"
    t.index ["pieceretenu_id"], name: "index_convocations_on_pieceretenu_id"
  end

  create_table "convocations_infractions", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "convocation_id", null: false
    t.bigint "infraction_id", null: false
  end

  create_table "departements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.index ["region_id"], name: "index_departements_on_region_id"
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

  create_table "groupements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phonecommandant"
    t.string "localisation"
    t.string "email"
    t.index ["region_id"], name: "index_groupements_on_region_id"
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
    t.string "source"
    t.bigint "zonecouverturemotif_id"
    t.bigint "region_id"
    t.bigint "departement_id"
    t.bigint "arrondissement_id"
    t.string "classe"
    t.index ["arrondissement_id"], name: "index_infractions_on_arrondissement_id"
    t.index ["departement_id"], name: "index_infractions_on_departement_id"
    t.index ["region_id"], name: "index_infractions_on_region_id"
    t.index ["zonecouverturemotif_id"], name: "index_infractions_on_zonecouverturemotif_id"
  end

  create_table "langues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
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
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.string "status"
    t.string "phone1"
    t.string "phone2"
    t.string "code"
    t.bigint "region_id"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["region_id"], name: "index_members_on_region_id"
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
    t.bigint "metropolisrole_id"
    t.index ["email"], name: "index_metropolis_on_email", unique: true
    t.index ["metropolisrole_id"], name: "index_metropolis_on_metropolisrole_id"
    t.index ["reset_password_token"], name: "index_metropolis_on_reset_password_token", unique: true
  end

  create_table "metropolisroles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paiements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "montant"
    t.bigint "convocation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["convocation_id"], name: "index_paiements_on_convocation_id"
  end

  create_table "paiementsolutions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "operator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieceretenus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postepolices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "agent_id"
    t.bigint "commissariat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.string "phone"
    t.string "email"
    t.bigint "grade_id"
    t.index ["agent_id"], name: "index_postepolices_on_agent_id"
    t.index ["commissariat_id"], name: "index_postepolices_on_commissariat_id"
    t.index ["grade_id"], name: "index_postepolices_on_grade_id"
    t.index ["region_id"], name: "index_postepolices_on_region_id"
  end

  create_table "regions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
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

  create_table "structures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "raison"
    t.string "contactname"
    t.string "contantprenom"
    t.string "contactphone"
    t.string "contactemail"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "pwd"
    t.string "rue"
    t.string "bp"
    t.string "phonestructure"
    t.string "fonction"
    t.index ["region_id"], name: "index_structures_on_region_id"
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
    t.string "entity"
  end

  create_table "unites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "villes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "long"
    t.string "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zonecouverturemotifs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admins", "roles"
  add_foreign_key "affectations", "agents"
  add_foreign_key "affectations", "commissariats"
  add_foreign_key "affectations", "postepolices"
  add_foreign_key "affectations", "regions"
  add_foreign_key "agents", "commissariats"
  add_foreign_key "agents", "grades"
  add_foreign_key "agents", "groupements"
  add_foreign_key "agents", "regions"
  add_foreign_key "alertes", "agents"
  add_foreign_key "alertes", "regions"
  add_foreign_key "alertes", "status", column: "statu_id"
  add_foreign_key "alertes", "types"
  add_foreign_key "arrondissements", "departements"
  add_foreign_key "arrondissements", "regions"
  add_foreign_key "bulletins", "commissariats"
  add_foreign_key "carrefours", "villes"
  add_foreign_key "centrepartenaires", "arrondissements"
  add_foreign_key "centrepartenaires", "departements"
  add_foreign_key "centrepartenaires", "regions"
  add_foreign_key "centrepartenaires", "structures"
  add_foreign_key "centrerecouvrements", "regions"
  add_foreign_key "comments", "alertes"
  add_foreign_key "commissariats", "arrondissements"
  add_foreign_key "commissariats", "departements"
  add_foreign_key "commissariats", "regions"
  add_foreign_key "constats", "agents"
  add_foreign_key "constats", "typeaccidents"
  add_foreign_key "convocations", "agents"
  add_foreign_key "convocations", "infractions"
  add_foreign_key "convocations", "pieceretenus"
  add_foreign_key "departements", "regions"
  add_foreign_key "fylos", "commissariats"
  add_foreign_key "fylos", "roles"
  add_foreign_key "groupements", "regions"
  add_foreign_key "infractions", "arrondissements"
  add_foreign_key "infractions", "departements"
  add_foreign_key "infractions", "regions"
  add_foreign_key "infractions", "zonecouverturemotifs"
  add_foreign_key "members", "regions"
  add_foreign_key "members", "services"
  add_foreign_key "metropolis", "metropolisroles"
  add_foreign_key "paiements", "convocations"
  add_foreign_key "postepolices", "agents"
  add_foreign_key "postepolices", "commissariats"
  add_foreign_key "postepolices", "grades"
  add_foreign_key "postepolices", "regions"
  add_foreign_key "services", "types"
  add_foreign_key "structures", "regions"
end
