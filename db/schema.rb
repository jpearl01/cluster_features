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

ActiveRecord::Schema.define(version: 20141008193227) do

  create_table "contigs", force: true do |t|
    t.string   "name"
    t.integer  "length"
    t.text     "sequence",   limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "strain_id"
  end

  add_index "contigs", ["strain_id"], name: "index_contigs_on_strain_id", using: :btree

  create_table "features", force: true do |t|
    t.string   "name"
    t.integer  "length"
    t.text     "sequence",   limit: 2147483647
    t.integer  "start"
    t.integer  "end"
    t.string   "annotation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contig_id"
    t.string   "f_type"
    t.integer  "strand"
  end

  add_index "features", ["contig_id"], name: "index_features_on_contig_id", using: :btree

  create_table "strains", force: true do |t|
    t.string   "name"
    t.integer  "length"
    t.integer  "contig_num"
    t.string   "genus"
    t.string   "species"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
