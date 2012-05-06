class CreateDishwashers < ActiveRecord::Migration
  def self.up
    create_table :dishwashers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :dishwashers
  end
end
