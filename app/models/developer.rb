class Developer < ActiveRecord::Base
  has_many :tasks
  has_many :bugs
end