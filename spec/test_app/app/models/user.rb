class User < ApplicationRecord
  include ActivityMonitor::ActivityUser
end
