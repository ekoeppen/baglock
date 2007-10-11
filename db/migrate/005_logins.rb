class Logins < ActiveRecord::Migration
  def self.up
    create_table :logins do |table|
      table.column :login,                     :string
      table.column :email,                     :string
      table.column :crypted_password,          :string, :limit => 40
      table.column :salt,                      :string, :limit => 40
      table.column :created_at,                :datetime
      table.column :updated_at,                :datetime
      table.column :remember_token,            :string
      table.column :remember_token_expires_at, :datetime
      table.column :can_modify,                :boolean
    end
  end

  def self.down
    drop_table :logins
  end
end
