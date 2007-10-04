class SprintController < ApplicationController
    active_scaffold :sprint do |config|
        config.list.columns = [:title, :start, :end]
        config.nested.add_link("Items", [:items])
        config.show.columns = config.create.columns = config.update.columns =
            [:title, :start, :end, :items]
        config.columns[:items].form_ui = :select
    end

    layout "activescaffold"
end
