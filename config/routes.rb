ActivityMonitor::Engine.routes.draw do


  get '/show', to: 'monitor#show', as: :show

  root to: 'monitor#index'

end
