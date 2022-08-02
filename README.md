# Validic API

API wrapper for Validic REST API.
# API Documentation

https://helpdocs.validic.com/reference/provision-a-user

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'validic_api_ruby'
```

And then,

```bash
bundle install
```

Or install it yourself as:

```bash
gem install validic_api_ruby
```

# Usage

The library needs to be configured with your account's key and secret. Set ValidicApi.org_id and ValidicApi.token to their values, ideally using hidden ENV variables.

Example Provisioning a User:

```ruby
require 'validic_api_ruby'

ValidicApi.org_id = ENV["VALIDIC_ORG_ID"]
DockHealthApi.token = ENV["VALIDIC_TOKEN"]

params = { 
  uid: "001", 
  location: { 
    timezone: "America/New_York", 
    country: "US" 
  }
}

ValidicApi::User.create(params)
```

# Development

There is a rake task configured to start up your console, just remember to set your org_id and token as discussed above.

`rake console`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BreakthroughBehavioralInc/validic_ruby_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/BreakthroughBehavioralInc/validic_ruby_api/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ValidicApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/BreakthroughBehavioralInc/validic_ruby_api/blob/main/CODE_OF_CONDUCT.md).
