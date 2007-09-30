class Tasks < ActiveRecord::Migration
    def self.up
        create_table :tasks do |table|
            table.column :title, :string
            table.column :description, :string
            table.column :status, :integer
            table.column :effort, :integer
            table.column :item_id, :integer
            table.column :developer_id, :integer
        end
    end
    
    def self.down
        drop_table :tasks
    end
end
