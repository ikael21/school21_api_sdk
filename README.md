# School21 API SDK

![test](https://github.com/ikael21/school21_api_sdk/actions/workflows/test.yml/badge.svg)
[![codecov](https://codecov.io/github/ikael21/school21_api_sdk/branch/main/graph/badge.svg?token=O7I31Q7N96)](https://codecov.io/github/ikael21/school21_api_sdk)
![rubocop](https://github.com/ikael21/school21_api_sdk/actions/workflows/rubocop.yml/badge.svg)

> [!NOTE]
> Development is still in progress, implementation may change in future versions.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add school21_api_sdk
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install school21_api_sdk
```

## Usage

Please check [docs](https://edu.21-school.ru/docs) for more information.

- Require the gem and configure client object

```ruby
require 'school21'

login = 'your_login_here'
password = 'your_password_here'

client = School21::Client.configure do |config|
  config.credentials = { login: login, password: password }

  # If you want to log client's requests and responses (turned off by default)
  config.enable_logging = true
end

# Request access token from the API server.
# Access token is stored inside client object and reused for API requests.
# If access token is expired client will automatically request a new one.
client.authenticate!
```

- Select the domain specific API that you want to use. This API has all endpoints related to that domain. Here's an example of `Participant API` and a call to `/participants/:login`

```ruby
participants_api = client.participants_api
response = participants_api.participant('peer_nickname')

if response.success?
  puts response.data
else
  # Error handling
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/ikael21/school21_api_sdk>.
