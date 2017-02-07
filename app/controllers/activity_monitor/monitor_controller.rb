require_dependency "activity_monitor/application_controller"
require_dependency 'groupdate'
require_dependency 'chartkick'
require "chartkick/engine"
include Chartkick::Helper


module ActivityMonitor
  class MonitorController < ApplicationController

    before_action :authenticate

    def index
      @keys = PublicActivity::Activity.distinct.pluck(:key)
      @data = PublicActivity::Activity.group_by_day(:created_at).count
      @activities =  scope_activities.limit(20)
    end

    def show
      @key = CGI.unescape(params[:key])
      @data = PublicActivity::Activity.where(key: @key).group_by_day(:created_at).count
      @activities = scope_activities.where(key: @key).limit(20)
    end


    private

    def scope_activities
      PublicActivity::Activity.order(created_at: :desc).includes(:owner)
    end
  end
end
