class Item < ActiveRecord::Base
  has_many :tasks
  belongs_to :sprint

  def total_effort
    total = 0
    self.tasks.each do |task| if task.effort then total += task.effort end
    end
    return total
  end 

  def total_effort=(effort)
  end
end