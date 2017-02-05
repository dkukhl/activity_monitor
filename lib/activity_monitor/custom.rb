module ActivityMonitor
  module Custom
    extend ActiveSupport::Concern

    included do
      if self.is_a?(Class) && self < ActiveRecord::Base
        include PublicActivity::Model
      end

      def self.monitor(actions)
        after_action :track_activity, only: actions
      end
    end

    def track_activity
      activity_user = send(ActivityMonitor.current_user_method)
      SaveActivityJob.perform_later(activity_user.id, params[:controller], params[:action])
    end
  end
end
