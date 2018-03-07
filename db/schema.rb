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

ActiveRecord::Schema.define(version: 20180307184528) do

  create_table "agents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "prenom"
    t.string "phone"
    t.string "matricule"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contravetions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  create_table "convocations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string "jour"
    t.string "sexe"
    t.bigint "agent_id"
    t.string "status"
    t.string "token"
    t.string "mois"
    t.string "an"
    t.string "code"
    t.bigint "infraction_id"
    t.index ["agent_id"], name: "index_convocations_on_agent_id"
    t.index ["infraction_id"], name: "index_convocations_on_infraction_id"
  end

  create_table "convocations_infractions", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "convocation_id", null: false
    t.bigint "infraction_id", null: false
  end

  create_table "infractions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "motif"
    t.string "montant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "prenom"
    t.string "sexe"
    t.string "cartegrise"
    t.string "immatriculation"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contravetions", "agents", column: "Agent_id"
  add_foreign_key "contravetions", "users", column: "User_id"
  add_foreign_key "convocations", "agents"
  add_foreign_key "convocations", "infractions"
end
