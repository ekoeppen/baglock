module Scruffy::Renderers
  # ===Scruffy::Renderers::Base
  #
  # Author:: A.J. Ostman
  # Date:: August 14th, 2006
  #
  # Provides a more appropriate rendering for Pie Charts
  class Pie < Base

    def initialize
      self.components = []
      self.components << Scruffy::Components::Background.new(:background, :position => [0,0], :size =>[100, 100])
   
      self.components << Scruffy::Components::Viewport.new(:graph_viewport, :position => [0, 0], :size => [100, 100]) do |view|
          # view << Scruffy::Components::Grid.new(:grid, :position => [20, 0], :size => [80, 90])
          # view << Scruffy::Components::ValueMarkers.new(:value_markers, :position => [0, 2], :size => [17.5, 90])
          # view << Scruffy::Components::DataMarkers.new(:data_markers, :position => [20, 94], :size => [80, 6])
          view << Scruffy::Components::Graphs.new(:graphs, :position => [0, 0], :size => [100, 100]) 
             
      end
         self.components << Scruffy::Components::Title.new(:title, :position => [5, 2], :size => [90, 7])
        self.components << Scruffy::Components::Legend.new(:legend, :position => [5, 13], :size => [90, 6])
    end

  end
end