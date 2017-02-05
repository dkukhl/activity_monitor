module ActivityMonitor
  class InstallGenerator < Rails::Generators::Base
    desc "Installs initializer and generates all necessary migrations"
    source_root File.expand_path("../templates", __FILE__)

    def copy_migrations
      rake('activity_monitor:install:migrations')
    end

    def mount_routes
      route "mount ActivityMonitor::Engine => '/monitor'"
    end

    def create_initializer
      copy_file "initializer.rb", "config/initializers/activity_monitor.rb"
    end
  end
end
