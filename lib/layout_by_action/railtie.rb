module LayoutByAction
  class Railtie < Rails::Railtie
    initializer "layout_by_action.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        include LayoutByAction::Able
      end
    end
  end
end