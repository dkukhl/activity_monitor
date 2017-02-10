module ActivityMonitor
  module Model

    def monitor(args)
      include PublicActivity::Model
      tracked args
    end

  end
end
