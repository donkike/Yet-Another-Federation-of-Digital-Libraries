class CreateCreatorsRecords < ActiveRecord::Migration
  def self.up
    create_table :creators_records, :id => false do |t|
      t.integer :creator_id
      t.integer :record_id

      t.timestamps
    end
  end

  def self.down
    drop_table :creators_records
  end
end
