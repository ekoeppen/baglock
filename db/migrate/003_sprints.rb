class Sprints < ActiveRecord::Migration
    def self.up
        create_table :sprints do |table|
            table.column :title, :string
            table.column :start, :date
            table.column :end, :date
        end
    end
    
    def self.down
        drop_table :sprints
    end
end
