module ActiveScaffold::Config
  class List < Base
    self.crud_type = :read

    def initialize(core_config)
      @core = core_config

      # inherit from global scope
      # full configuration path is: defaults => global table => local table
      @per_page = self.class.per_page

      # originates here
      default_sorting_column = ActiveScaffold::DataStructures::Column.new(@core.model.table_name + '.' + @core.model.primary_key, @core.model)
      @sorting = ActiveScaffold::DataStructures::Sorting.new(@core.columns)
      @sorting.add default_sorting_column, 'ASC'

      # inherit from global scope
      @empty_field_text = self.class.empty_field_text
    end

    # global level configuration
    # --------------------------
    # how many records to show per page
    cattr_accessor :per_page
    @@per_page = 15

    # what string to use when a field is empty
    cattr_accessor :empty_field_text
    @@empty_field_text = '-'

    # instance-level configuration
    # ----------------------------

    # provides access to the list of columns specifically meant for the Table to use
    def columns
      self.columns = @core.columns.content_column_names unless @columns # lazy evaluation
      @columns
    end
    def columns=(val)
      @columns = ActiveScaffold::DataStructures::ActionColumns.new(*val)
      @columns.action = self
    end

    # how many rows to show at once
    attr_accessor :per_page

    # what string to use when a field is empty
    attr_accessor :empty_field_text

    # the default sorting. should be an array of hashes of {column_name => direction}, e.g. [{:a => 'desc'}, {:b => 'asc'}]. to just sort on one column, you can simply provide a hash, though, e.g. {:a => 'desc'}.
    def sorting=(val)
      val = [val] if val.is_a? Hash
      sorting.clear
      val.each { |clause| sorting.add *clause.to_a.first }
    end
    def sorting
      @sorting ||= ActiveScaffold::DataStructures::Sorting.new(@core.columns)
    end

    # the label for this List action. used for the header.
    attr_writer :label
    def label
      @label ? as_(@label) : @core.label
    end

    class UserSettings < UserSettings
      # This label has alread been localized.
      def label
        @session[:label] ? @session[:label] : @conf.label
      end

      def per_page
        @session['per_page'] = @params['limit'].to_i if @params.has_key? 'limit'
        @session['per_page'] || @conf.per_page
      end

      def page
        @session['page'] = @params['page'] if @params.has_key? 'page'
        @session['page'] || 1
      end

      def page=(value = nil)
        @session['page'] = value
      end

      def sorting
        # we want to store as little as possible in the session, but we want to return a Sorting data structure. so we recreate it each page load based on session data.
        @session['sort'] = [@params['sort'], @params['sort_direction']] if @params['sort'] and @params['sort_direction']
        @session['sort'] = nil if @params['sort_direction'] == 'reset'

        if @session['sort']
          sorting = @conf.sorting.clone
          sorting.set(*@session['sort'])
          return sorting
        else
          return @conf.sorting
        end
      end
    end
  end
end
