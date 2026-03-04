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

ActiveRecord::Schema[7.2].define(version: 2026_03_04_105759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datasets", force: :cascade do |t|
    t.string "original_name"
    t.string "storage_key"
    t.bigint "size_bytes"
    t.string "checksum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_attempts", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.integer "attempt_no", null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "error_class"
    t.text "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id", "attempt_no"], name: "index_job_attempts_on_job_id_and_attempt_no", unique: true
    t.index ["job_id"], name: "index_job_attempts_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "dataset_id", null: false
    t.string "job_type", null: false
    t.jsonb "params", default: {}, null: false
    t.string "status", default: "queued", null: false
    t.integer "progress", default: 0, null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "idempotency_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dataset_id"], name: "index_jobs_on_dataset_id"
    t.index ["idempotency_key"], name: "index_jobs_on_idempotency_key"
    t.index ["status"], name: "index_jobs_on_status"
  end

  add_foreign_key "job_attempts", "jobs"
  add_foreign_key "jobs", "datasets"
end
