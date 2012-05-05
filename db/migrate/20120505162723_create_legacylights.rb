class CreateLegacylights < ActiveRecord::Migration
  def self.up
    create_table :legacylights do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :legacylights
  end
end
