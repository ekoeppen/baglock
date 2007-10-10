class DeveloperController < ApplicationController
  active_scaffold :developer do |config|
    config.columns[:tasks].form_ui = :select
    config.list.columns =
      [:name, :tasks]
    config.show.columns = 
      [:name, :tasks]
    config.create.columns =
      [:name]
    config.update.columns =
      [:name, :tasks]
    config.nested.add_link("Tasks", [:tasks])
  end

  def create_authorized?
    return current_user != nil
  end
  
  layout "activescaffold"
end
