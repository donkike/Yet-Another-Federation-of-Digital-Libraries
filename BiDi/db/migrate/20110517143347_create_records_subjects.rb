class CreateRecordsSubjects < ActiveRecord::Migration
  def self.up
    create_table :records_subjects, :id => false do |t|
      t.integer :subject_id
      t.integer :record_id

      t.timestamps
    end
  end

  def self.down
    drop_table :records_subjects
  end
end
