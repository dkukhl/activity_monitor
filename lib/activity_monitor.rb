require "activity_monitor/engine"

module ActivityMonitor
  def self.setup
    yield self
  end
end
