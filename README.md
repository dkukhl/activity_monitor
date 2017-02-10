# ActivityMonitor
[![Build Status](https://travis-ci.org/dkukhl/activity_monitor.svg?branch=master)](https://travis-ci.org/dkukhl/activity_monitor)
[![Code Climate](https://codeclimate.com/github/dkukhl/activity_monitor/badges/gpa.svg)](https://codeclimate.com/github/dkukhl/activity_monitor)

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

### Tracking models

To record any model's create/update/destroy actions, just add this to your model:

```ruby
class Item < ApplicationRecord

  monitor   

end
```

All parameters of public_activity's 'tracked' method apply. you can use :only, :except and so on.


### Tracking controller actions

To record controller actions put this in your controller:

```ruby
class PostsController < ApplicationController
  
  monitor_actions :index

end
```

You can pass single action or an array of actions to be monitored

## Analytics

Navigate to '/monitor' to see available statistics and charts. Charts are powered by Chartkick and Highcharts (included in the gem)

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
