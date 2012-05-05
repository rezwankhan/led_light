class CreateSiteinfos < ActiveRecord::Migration
  def self.up
    create_table :siteinfos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :siteinfos
  end
end
