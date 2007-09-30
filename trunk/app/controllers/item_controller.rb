class ItemController < ApplicationController
    active_scaffold :item do |config|
        config.label = "Product Backlog"
        config.list.columns = [:title, :description, :priority, :effort, :status, :notes]
        config.nested.add_link("Tasks", [:tasks])
    end
    layout "activescaffold"
end
