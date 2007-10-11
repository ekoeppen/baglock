class DeveloperController < ApplicationController
  active_scaffold :developer do |config|
    config.columns[:tasks].form_ui = :select
    config.list.columns =
      [:name, :tasks, :bugs]
    config.show.columns = 
      [:name, :tasks, :bugs]
    config.create.columns =
      [:name]
    config.update.columns =
      [:name, :tasks, :bugs]

    config.nested.add_link("Tasks", [:tasks])
    config.nested.add_link("Bugs", [:bugs])
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
