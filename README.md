# YrNo

[forecast.io API](http://api.yr.no/weatherapi/documentation) wrapper in Ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'yr_no'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yr_no

## Usage

Get the current forecast:

``` ruby
YrNo.locationforecast(37.8267, -122.423, 12)
```

``` ruby
YrNo.locationforecast(37.8267, -122.423, 12)
```

### Changing the default http adapter ###

The HTTP requests are made with
[Faraday](https://github.com/lostisland/faraday), which uses `Net::HTTP` by
default. Changing the adapter is easy. We will use typhoeus as an example.

Make sure to include the typhoeus gem in your `Gemfile`:

```ruby
gem 'typhoeus'
```

```ruby
require 'typhoeus/adapters/faraday'

Faraday.default_adapter = :typhoeus
```

Alternatively:

```ruby
require 'typhoeus/adapters/faraday'

ForecastIO.connection = Faraday.new do |builder|
  builder.adapter :typhoeus
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/yr_no/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
