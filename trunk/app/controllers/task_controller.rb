class TaskController < ApplicationController
  active_scaffold :task do |config|
    config.columns[:item].form_ui = :select
    config.columns[:developer].form_ui = :select
    config.columns[:description].form_ui = :textarea
    config.columns[:description].options = { :rows => 25, :cols => 80 }
    config.columns[:id].label = "ID"
    config.columns[:completed].form_ui = :calendar

    config.list.sorting = { :item => :asc }

    config.list.columns =
      [:id, :item, :title, :completed, :effort, :description, :developer]
    config.show.columns = 
      [:id, :item, :title, :description, :completed, :effort, :developer]
    config.update.columns =
      [:item, :title, :description, :completed, :effort, :developer]
    config.create.columns =
      [:item, :title, :description, :effort]
  end

  def create_authorized?
    return current_user != nil
  end
  
  layout "activescaffold"
end
