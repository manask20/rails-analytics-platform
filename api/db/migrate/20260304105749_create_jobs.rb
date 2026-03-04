class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.references :dataset, null: false, foreign_key: true

      t.string :job_type, null: false
      t.jsonb :params, null: false, default: {}

      t.string :status, null: false, default: "queued"
      t.integer :progress, null: false, default: 0

      t.datetime :started_at
      t.datetime :finished_at

      t.string :idempotency_key

      t.timestamps
    end

    add_index :jobs, :status
    add_index :jobs, :idempotency_key
  end
end
