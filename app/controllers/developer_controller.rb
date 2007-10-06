class DeveloperController < ApplicationController
  active_scaffold :developer do |config|
    config.columns[:tasks].form_ui = :select
  end

  layout "activescaffold"
end
