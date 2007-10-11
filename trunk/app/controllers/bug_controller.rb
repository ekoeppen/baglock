class BugController < ApplicationController
  active_scaffold :bug do |config|
    config.columns[:notes].form_ui = :textarea
    config.columns[:notes].options = { :rows => 25, :cols => 80 }
    config.columns[:id].label = "ID"
    config.columns[:created].form_ui = :calendar
    config.columns[:fixed].form_ui = :calendar
    config.columns[:developer].form_ui = :select

    config.list.sorting = { :id => :asc }

    config.list.columns =
      [:id, :title, :created, :fixed, :notes, :developer]
    config.show.columns = 
      [:id, :title, :created, :fixed, :notes, :developer]
    config.update.columns =
      [:title, :created, :fixed, :notes, :developer]
    config.create.columns =
      [:title, :created, :notes, :developer]
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
