class CreateJobAttempts < ActiveRecord::Migration[7.1]
  def change
    create_table :job_attempts do |t|
      t.references :job, null: false, foreign_key: true

      t.integer :attempt_no, null: false

      t.datetime :started_at
      t.datetime :finished_at

      t.string :error_class
      t.text :error_message

      t.timestamps
    end

    add_index :job_attempts, [:job_id, :attempt_no], unique: true
  end
end
