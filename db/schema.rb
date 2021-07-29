# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_29_134932) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "health_base_points"
    t.integer "attack_base_points"
    t.integer "experience", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name", null: false
    t.integer "attack_points", default: 0
    t.integer "defense_points", default: 0
    t.integer "required_experience", default: 0
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fight_participation_equipments", force: :cascade do |t|
    t.integer "fight_participation_id", null: false
    t.integer "equipment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipment_id"], name: "index_fight_participation_equipments_on_equipment_id"
    t.index ["fight_participation_id"], name: "index_fight_participation_equipments_on_fight_participation_id"
  end

  create_table "fight_participations", force: :cascade do |t|
    t.integer "fight_id", null: false
    t.integer "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_fight_participations_on_character_id"
    t.index ["fight_id"], name: "index_fight_participations_on_fight_id"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "winner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  add_foreign_key "fight_participation_equipments", "equipment"
  add_foreign_key "fight_participation_equipments", "fight_participations"
  add_foreign_key "fight_participations", "characters"
  add_foreign_key "fight_participations", "fights"
  add_foreign_key "fights", "characters", column: "winner_id"
end
