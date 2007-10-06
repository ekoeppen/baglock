class Task < ActiveRecord::Base
  belongs_to :item
  belongs_to :developer
end