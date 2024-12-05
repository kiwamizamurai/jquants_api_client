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

## Reference

1. https://jpx-jquants.com/
2. https://github.com/J-Quants/jquants-api-client-python
