require "activity_monitor/engine"
require "activity_monitor/railtie"
require "activity_monitor/model"
require "activity_monitor/custom"
require "activity_monitor/tracker"

require "public_activity"

module ActivityMonitor

  mattr_accessor :user_class
  self.user_class = 'User'

  mattr_accessor :current_user_method
  self.current_user_method = 'current_user'

  mattr_accessor :authentication_method
  self.authentication_method = nil

  def self.setup
    yield self

    ActivityMonitor.user_class.constantize.class_eval do
      include PublicActivity::Common
    end

  end


end
