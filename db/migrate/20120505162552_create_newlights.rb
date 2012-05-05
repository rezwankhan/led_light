class CreateNewlights < ActiveRecord::Migration
  def self.up
    create_table :newlights do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :newlights
  end
end
