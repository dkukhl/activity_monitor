# ActivityMonitor
Painless user activity analytics based on public_activity, ActiveJob and chartkick.
https://travis-ci.org/dkukhl/activity_monitor.svg?branch=master
https://codeclimate.com/github/dkukhl/activity_monitor/badges

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'activity_monitor'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install activity_monitor
```

Install initializer and migrations
```bash
$ rails generate activity_monitor:install
```

Finally, run the migrations on database
```bash
$ rake db:migrate
```

## Setup

See config/initializers/activity_monitor for options as:

```ruby
ActivityMonitor.setup do |config|

  # Set your users model name. 'User' by default
  config.user_class = 'User'
  #
  #
  # Set your current user method.  'current_user' by default
  config.current_user_method = 'current_user'
  #
  #
  # Set your method to authenticate user who can access monitor. Not authenticated by default
  config.authentication_method = 'authenticate_admin'
end
```

Note, that authentication is NOT enabled by default. You should define authentication method to enable it.

## Usage

### Tracking basic CRUD actions
To record any model's create/update/destroy actions, just add this to your model:

```ruby
include ActivityMonitor::Model
tracked
```

'tracked' is a method provided by public_activity gem, all the options apply

### Tracking custom controller actions
All custom actions will be assotiated with current user. In your user model add this:

```ruby
include ActivityMonitor::User
```

To record custom actions put this in your controller:

```ruby
include ActivityMonitor::Custom
monitor [:index, :dashboard]
```

where the array contains actions to be tracked

## Analytics

Navigate to '/monitor' to see available statistics and charts. Charts are powered by Chartkick and Highcharts (included in the gem)

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
