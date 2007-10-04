class TaskController < ApplicationController
    active_scaffold :task do |config|
        config.columns[:item].ui_type = :select
        config.columns[:description].ui_type = :textarea
    end
    layout "activescaffold"
end
