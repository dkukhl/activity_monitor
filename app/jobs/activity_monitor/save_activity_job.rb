module ActivityMonitor
  class SaveActivityJob < ApplicationJob
    queue_as :default

    def perform(user_id, controller, action)
      user = ActivityMonitor.user_class.constantize.find(user_id)
      user.create_activity key: "user.#{controller}-#{action}", owner: user
    end
  end
end
