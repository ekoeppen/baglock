class Bugs < ActiveRecord::Migration
  def self.up
      create_table :bugs do |table|
        table.column :title, :string
        table.column :created, :date
        table.column :fixed, :date
        table.column :notes, :string
        table.column :developer_id, :integer
      end
    end

    def self.down
      drop_table :bugs
    end
end
