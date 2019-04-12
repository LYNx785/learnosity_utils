# LearnosityUtils

LearnosityUtils wraps the ```learnosity-sdk``` gem, adding easy user configuration, and preset method generation for commonly used [Learnosity Data Api](https://reference.learnosity.com/data-api) **itembank** endpoints

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'learnosity_utils'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install learnosity_utils

## Usage

After installation you'll need configure the gem with your Learnosity provided credentials.

```ruby
LearnosityUtils.configure do |config|
  config.consumer_secret = '74c5fd430cf1242a527f6223aebd42d30464be22'
  config.security_packet = {
    'consumer_key' => 'yis0TYCu7U9V4o7M',
    'domain' => 'localhost'
  }
end
``` 

Note: _The example contains **demo** credentials exposed by Learnosity's [data-api demo site](https://demos.learnosity.com/analytics/data/index.php)_

The itembank endpoints currently accessible as **getters** and **setters** are:
* items
* items_tags
* questions
* features
* activities

When performing a **get** request, the only parameter necessary is an array of reference IDs
 
```ruby
references = ['1234567890']

LearnosityUtils::EndPoint::ItemBank.send(:get_items, references)
```

## Code of Conduct

Everyone interacting in this codebase and issue tracker is expected to follow the [code of conduct](https://github.com/[USERNAME]/learnosity_utils/blob/master/CODE_OF_CONDUCT.md)

## License

The gem is available as open source under the terms of the [MIT license](https://opensource.org/licenses/MIT)