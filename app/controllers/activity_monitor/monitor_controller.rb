require_dependency "activity_monitor/application_controller"
require_dependency 'groupdate'
require_dependency 'chartkick'


module ActivityMonitor
  class MonitorController < ApplicationController
    def index
      @keys = PublicActivity::Activity.uniq.pluck(:key)
    end

    def show
      @key = CGI.unescape(params[:key])
      @data = PublicActivity::Activity.where(key: @key).group_by_day(:created_at).count
    end
  end
end
