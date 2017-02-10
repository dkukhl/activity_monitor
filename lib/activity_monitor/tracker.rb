module ActivityMonitor
  module Tracker


    def track_activity
      activity_user = send(ActivityMonitor.current_user_method)
      if activity_user
        SaveActivityJob.perform_later(activity_user.id, params[:controller], params[:action])
      end
    end

  end
end
