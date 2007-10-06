class SprintController < ApplicationController
  active_scaffold :sprint do |config|
    config.list.sorting = { :title => :asc }
    config.nested.add_link("Items", [:items])
    
    config.columns =
      [:title, :start, :end, :total_points, :total_effort, :effort_per_day]

    config.list.columns =
      [:title, :start, :end, :total_points, :total_effort]
    config.show.columns = 
      [:title, :start, :end, :total_points, :total_effort, :effort_per_day]
    config.create.columns = 
      [:title, :start, :end]
    config.update.columns =
      [:title, :start, :end, :items]
    config.columns[:items].form_ui = :select
    config.columns[:start].form_ui = :calendar
    config.columns[:end].form_ui = :calendar
    
    config.columns[:effort_per_day].form_ui = :graph
  end
  
  layout "activescaffold"
end
