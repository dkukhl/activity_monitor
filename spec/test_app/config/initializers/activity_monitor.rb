ActivityMonitor.setup do |config|

  # Set your users model name. 'User' by default
  #
  # config.user_class = 'User'
  #
  #
  # Set your current user method.  'current_user' by default
  #
  # config.current_user_method = 'current_user'
  #
  #
  # Set your method to authenticate user who can access monitor. Not authenticated by default
  #
  config.authentication_method = 'authenticate_admin'

end
