module LayoutByAction
  module Able
    extend ActiveSupport::Concern

    def layout_by_action(action_name=params[:action])
      self.class.layout_heirarchy(action_name).first
    end

    module ClassMethods
      def default_layout=(value)
        @default_layout = value
      end

      def default_layout
        @default_layout
      end

      def layouts
        @layouts ||= HashWithIndifferentAccess.new
      end

      def layout_by_action(default=nil, actions_and_layouts)
        include LayoutByAction::Able
        self.default_layout = default
        actions_and_layouts.each do |actions, layout|
          Array(actions).each do |action|
            layouts[action] = layout
          end
        end
        layout :layout_by_action
      end

      def layout_heirarchy(action_name)
        ancestors.grep(Class).select do |klass|
          klass.ancestors.grep(Class).include?(ActionController::Base)
        end.select do |klass|
          klass != ActionController::Base
        end.collect do |klass|
          klass.layouts[action_name] || klass.default_layout
        end.compact
      end
    end

  end
end