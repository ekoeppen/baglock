class TaskController < ApplicationController
    active_scaffold :task do |config|
    end
    layout "activescaffold"
end
