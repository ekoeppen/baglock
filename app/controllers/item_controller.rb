class ItemController < ApplicationController
  active_scaffold :item do |config|
    config.columns[:description].form_ui = :textarea
    config.columns[:description].options = { :rows => 25, :cols => 80 }
    config.columns[:notes].form_ui = :textarea
    config.columns[:notes].options = { :rows => 25, :cols => 80 }
    config.columns[:done].form_ui = :checkbox
    config.columns[:id].label = "ID"
    config.columns[:sprint].form_ui = :select
    config.columns[:tasks].form_ui = :select

    config.list.sorting = { :id => :asc }
    config.nested.add_link("Tasks", [:tasks])

    config.list.columns =
      [:id, :title, :description, :sprint, :priority, :story_points, :total_effort, :done]
    config.show.columns = 
      [:id, :title, :description, :sprint, :priority, :story_points, :total_effort, :done, :notes, :tasks]
    config.create.columns =
      [:title, :description, :priority, :story_points, :notes]
    config.update.columns =
      [:title, :description, :sprint, :priority, :story_points, :done, :notes, :tasks]
  end
  
  def create_authorized?
    return user_can_modify?
  end

  def update_authorized?
    return user_can_modify?
  end

  def delete_authorized?
    return user_can_modify?
  end

  layout "activescaffold"
end
