Rails.application.routes.draw do
  mount ActivityMonitor::Engine => '/monitor'

  get 'posts/index'

  get 'posts/popular'

end
