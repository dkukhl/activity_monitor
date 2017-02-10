module ActivityMonitor
  module Custom

    def monitor_actions(actions)
      include Tracker
      after_action :track_activity, only: actions
    end

  end
end
