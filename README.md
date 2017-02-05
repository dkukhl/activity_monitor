# ActivityMonitor
Painless user activity analytics based on public_activity, ActiveJob and chartkick.

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
