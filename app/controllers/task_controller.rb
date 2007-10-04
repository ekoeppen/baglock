class TaskController < ApplicationController
    active_scaffold :task do |config|
        config.columns[:item].form_ui = :select
        config.columns[:description].form_ui = :textarea
        config.columns[:description].options = { :rows => 25, :cols => 80 }
        config.list.columns = [:item, :title, :status, :effort, :description, :developer]
        config.show.columns = config.update.columns = config.create.columns =
            [:item, :title, :description, :status, :effort, :developer]
    end

    layout "activescaffold"
end
