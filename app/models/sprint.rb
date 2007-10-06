class Sprint < ActiveRecord::Base
  has_many :items
  has_many :tasks, :through => :items
  
  def total_effort
    total = 0
    self.items.each do |i|
      total += i.total_effort
    end
    return total
  end 

  def total_points
    total = 0
    self.items.each do |i|
      if i.story_points then total += i.story_points end
    end
    return total
  end
  
  def effort_per_day
    days = {}
    self.start.upto(self.end) do |day| days[day] = 0 end

    list = []
    self.tasks.each do |task|
      if task.completed then list << task end
    end

    list.each do |task|
      if task.effort then days[task.completed] += task.effort end
    end

    return days
  end
  
  def total_effort=(points)
  end

  def total_points=(points)
  end
end