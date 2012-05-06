class CreateRefridgerators < ActiveRecord::Migration
  def self.up
    create_table :refridgerators do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :refridgerators
  end
end
