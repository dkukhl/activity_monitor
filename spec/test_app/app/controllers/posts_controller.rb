class PostsController < ApplicationController
  include ActivityMonitor::Custom
  monitor [:popular]

  def index
  end

  def popular
  end
end
