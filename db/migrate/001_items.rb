class Items < ActiveRecord::Migration
    def self.up
        create_table :items do |table|
            table.column :title, :string
            table.column :description, :string
            table.column :notes, :string
            table.column :done, :boolean
            table.column :effort, :integer
            table.column :priority, :integer
            table.column :sprint_id, :integer
        end
    end
    
    def self.down
        drop_table :items
    end
end
