class Sprint < ActiveRecord::Base
  has_many :items
  
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
  
  def total_effort=(points)
  end

  def total_points=(points)
  end
end