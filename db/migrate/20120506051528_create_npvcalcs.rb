class CreateNpvcalcs < ActiveRecord::Migration
  def self.up
    create_table :npvcalcs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :npvcalcs
  end
end
