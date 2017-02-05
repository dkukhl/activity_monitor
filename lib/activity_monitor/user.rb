module ActivityMonitor
  module ActivityUser
    extend ActiveSupport::Concern

    included do
      include PublicActivity::Common
    end
  end
end
