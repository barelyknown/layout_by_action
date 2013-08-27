module LayoutByAction
  module Able
    extend ActiveSupport::Concern

    def layout_by_action(action_name=params[:action])
      self.class.layouts[action_name] || super || self.class.default_layout
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
    end

  end
end