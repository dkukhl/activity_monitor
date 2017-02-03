Rails.application.routes.draw do
  mount ActivityMonitor::Engine => "/activity_monitor"
end
