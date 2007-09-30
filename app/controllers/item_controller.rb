class ItemController < ApplicationController
    active_scaffold :item do |config|
        config.label = "Product Backlog"
#        config.columns = [:title, :description, :priority, :effort, :status, :notes]
        config.nested.add_link("Tasks", [:task])
    end
    layout "activescaffold"
end
