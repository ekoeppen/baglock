module SprintHelper
  def effort_per_day_form_column(record, input_name)
  end

  def effort_per_day_column(record)
    efforts = @record.effort_per_day.sort
    max_effort = current = @record.total_effort
    first = 0
    last = efforts.length - 1
    values = []
    markers = []

    graph = Scruffy::Graph.new :title => 'Sprint Burndown'
    graph.value_formatter = Scruffy::Formatters::Number.new :precision => :none
    first.upto(last) do |day|
      markers << day + 1
      values << current
      current -= efforts[day][1]
    end
    layer = Scruffy::Layers::Line.new :title => 'Remaining Effort', :points => values
    graph.point_markers = markers
    graph.add layer

    graph.render(:max_value => max_effort, :min_value => 0, :to => "#{RAILS_ROOT}/public/generated/sprint-#{@record.id}-burndown.svg")
    return "<embed type='image/svg+xml' src='/generated/sprint-#{@record.id}-burndown.svg' width=600 height=360 />"
  end
end
