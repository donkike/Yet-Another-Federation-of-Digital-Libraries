class CreateLibraries < ActiveRecord::Migration
  def self.up
    create_table :libraries do |t|
      t.string :name
      t.string :protocol
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :libraries
  end
end
