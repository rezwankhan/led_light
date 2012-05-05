class CreateRecengines < ActiveRecord::Migration
  def self.up
    create_table :recengines do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :recengines
  end
end
