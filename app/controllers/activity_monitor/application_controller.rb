module ActivityMonitor
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    private

    def authenticate
      if ActivityMonitor.authentication_method
        unless send(ActivityMonitor.authentication_method)
          head :unauthorized 
        end
      end
    end

  end
end
