class ItemController < ApplicationController
    active_scaffold :item do |config|
        config.columns[:description].form_ui = :textarea
        config.columns[:description].options = { :rows => 25, :cols => 80 }
        config.columns[:notes].form_ui = :textarea
        config.columns[:notes].options = { :rows => 25, :cols => 80 }
        config.nested.add_link("Tasks", [:tasks])
        config.list.columns = [:title, :description, :sprint, :priority, :effort, :done, :notes]
        config.show.columns = config.create.columns = config.update.columns =
            [:title, :description, :sprint, :priority, :effort, :done, :notes, :tasks]
            
#        config.actions.add :print_pdf
#        config.actions.add :print_html
#        config.actions << :print_list
#        config.actions << :export
    end

    layout "activescaffold"
end
