class Developers < ActiveRecord::Migration
  def self.up
    create_table :developers do |table|
      table.column :name, :string
    end
  end
  
  def self.down
    drop_table :developers
  end
end
