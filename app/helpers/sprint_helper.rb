module SprintHelper
  def effort_per_day_form_column(record, input_name)
  end

  def effort_per_day_column(record)
    efforts = @record.effort_per_day.sort
    max_effort = current = @record.total_effort
    first = 0
    last = efforts.length - 1
    values = [max_effort]
    markers = [0]

    theme = Scruffy::Themes::RubyBlog.new
    theme.background = :black
    graph = Scruffy::Graph.new :title => 'Sprint Burndown', :theme => theme
    graph.value_formatter = Scruffy::Formatters::Number.new :precision => :none
    first.upto(last) do |day|
      current -= efforts[day][1]
      markers << day + 1
      if efforts[day][1] > 0 then
        values << current
      else
        values << nil
      end
    end
    layer = Scruffy::Layers::Line.new :title => 'Remaining Effort', :points => values
    graph.point_markers = markers
    graph.add layer

    graph.render(:max_value => max_effort, :min_value => 0, :to => "#{RAILS_ROOT}/public/generated/sprint-#{@record.id}-burndown.svg")
    return "<embed type='image/svg+xml' src='/generated/sprint-#{@record.id}-burndown.svg' width=600 height=400 />"
  end
end
