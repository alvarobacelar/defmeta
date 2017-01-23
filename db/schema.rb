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

ActiveRecord::Schema.define(version: 20170121132555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configs", force: :cascade do |t|
    t.integer  "valor_ganho"
    t.integer  "valor_dificuldade"
    t.integer  "valor_tipo"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "detalhamentos", force: :cascade do |t|
    t.text     "item"
    t.integer  "meta_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "status",     default: false
  end

  create_table "dificuldades", force: :cascade do |t|
    t.string   "nome"
    t.integer  "valor_dificuldade"
    t.string   "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "ganhos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "valor_ganho"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "metas", force: :cascade do |t|
    t.string   "nome"
    t.integer  "tipo_id"
    t.integer  "dificuldade_id"
    t.integer  "ganho_id"
    t.integer  "usuario_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "nivel"
    t.integer  "coeficientetipo"
    t.integer  "coeficientedificuldade"
    t.integer  "coeficienteganho"
    t.integer  "pontuacao"
    t.date     "datameta"
  end

  create_table "tipos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "valor_tipo"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nome"
    t.string   "perfil"
    t.boolean  "ativo"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

end
