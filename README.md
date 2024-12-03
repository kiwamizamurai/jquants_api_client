# JquantsApiClient

[![Gem Version](https://img.shields.io/gem/v/jquants_api_client.svg)](https://rubygems.org/gems/jquants_api_client)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/kiwamizamurai/jquants_api_client/blob/main/LICENSE.txt)
[![Test](https://github.com/kiwamizamurai/jquants_api_client/actions/workflows/test.yaml/badge.svg)](https://github.com/kiwamizamurai/jquants_api_client/actions/workflows/test.yaml)

J-Quants API Client for Ruby


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jquants_api_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jquants_api_client

## Usage

To use the JquantsApiClient, you need to initialize the client with your credentials. Here’s a sample code snippet:

```ruby
require 'jquants_api_client'

# Initialize the client with a refresh token
client = JquantsApiClient::Client.new(refresh_token: 'your_refresh_token_here')

# Get a new refresh token
begin
  new_refresh_token = client.get_refresh_token('your_email@example.com', 'your_password')
  puts "New refresh token: #{new_refresh_token}"
rescue ArgumentError => e
  puts "Error: #{e.message}"
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end

# Get the ID token
begin
  id_token = client.get_id_token
  puts "ID Token: #{id_token}"
rescue StandardError => e
  puts "An error occurred while getting ID token: #{e.message}"
end

# Get listed information
begin
  listed_info = client.get_listed_info('your_stock_symbol')
  puts "Listed Info: #{listed_info}"
rescue StandardError => e
  puts "An error occurred while fetching listed info: #{e.message}"
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kiwamizamurai/jquants_api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JquantsApiClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kiwamizamurai/jquants_api_client/blob/master/CODE_OF_CONDUCT.md).
