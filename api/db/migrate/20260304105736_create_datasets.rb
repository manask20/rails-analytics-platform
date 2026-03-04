class CreateDatasets < ActiveRecord::Migration[7.2]
  def change
    create_table :datasets do |t|
      t.string :original_name
      t.string :storage_key
      t.bigint :size_bytes
      t.string :checksum

      t.timestamps
    end
  end
end
