class CreateWashers < ActiveRecord::Migration
  def self.up
    create_table :washers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :washers
  end
end
