module ActivityMonitor
  module Model
    extend ActiveSupport::Concern

    included do
      include PublicActivity::Model
    end
  end
end
