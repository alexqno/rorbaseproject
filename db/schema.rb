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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150517131304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grupo_permissoes", force: :cascade do |t|
    t.integer  "grupo_id"
    t.integer  "permissao_id"
    t.string   "valor"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "grupos", force: :cascade do |t|
    t.integer  "status"
    t.string   "descricao"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_root",    default: false
  end

  create_table "permissoes", force: :cascade do |t|
    t.string   "chave"
    t.string   "descricao"
    t.integer  "tipo"
    t.integer  "modulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "pessoa_id"
    t.string   "password_digest"
    t.integer  "status",          default: 0
    t.integer  "grupo_id"
  end

  add_foreign_key "grupo_permissoes", "grupos", name: "grupo_permissoes_grupo_id_fk"
  add_foreign_key "grupo_permissoes", "permissoes", name: "grupo_permissoes_permissao_id_fk"
  add_foreign_key "users", "grupos", name: "users_grupo_id_fk"
  add_foreign_key "users", "pessoas", name: "users_pessoa_id_fk"
end
