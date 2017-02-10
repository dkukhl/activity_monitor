require 'rails'

module ActivityMonitor
  class Railtie < Rails::Railtie
    initializer 'activity_monitor.initialize' do
      ActiveSupport.on_load :active_record  do
        ActiveRecord::Base.send :extend, Model
      end
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send :extend, Custom
      end
    end
  end
end
