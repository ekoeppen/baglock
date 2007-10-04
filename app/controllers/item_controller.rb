class ItemController < ApplicationController
    active_scaffold :item do |config|
        config.label = "Product Backlog"
        config.columns[:description].form_ui = :textarea
        config.columns[:description].options = { :rows => 25, :cols => 80 }
        config.columns[:notes].form_ui = :textarea
        config.columns[:notes].options = { :rows => 25, :cols => 80 }
        config.nested.add_link("Tasks", [:tasks])
        config.list.columns = [:title, :description, :sprint, :priority, :effort, :status, :notes]
        config.show.columns = config.create.columns = config.update.columns =
            [:title, :description, :sprint, :priority, :effort, :status, :notes, :tasks]
    end

    layout "activescaffold"
end
