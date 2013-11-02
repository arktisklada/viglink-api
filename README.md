# Viglink

This gem is a wrapper for the [Viglink Catalog API](http://support.viglink.com/entries/22326692-VigLink-Catalog-API-Documentation).  This gem contains module methods for each API endpoint, as well as an additional subset for the CUID revenue API.

## Installation

Command line installation:

    gem install viglink-api

Or add this line to your application's Gemfile:

    gem 'viglink-api'

And then execute bundler:

    bundle

---

## Usage

#### Command Line

To use on the command line, simply require the file and create a new client

```ruby
require 'viglink_api'
viglink = ViglinkApi::Client.new({:api_key => ENV['VIGLINK_API_KEY']})
```

#### Rails

Include the `viglink-api` gem in your Gemfile and bundle.  The module can be configured by creating a config file:

`config/initializers/viglink.rb`

```ruby
ViglinkApi.configure do |config|
	config.api_key = "your_api_key"
end
```

Please see below for more configuration options.

### Search Methods

Please refer to the [Viglink Catalog API documentation](http://support.viglink.com/entries/22326692-VigLink-Catalog-API-Documentation) for details on additional fields that can be included.  Each method can accept a hash of values to pass through to the search.  *Key is included by default.*

- `find_products`
- `find_merchants`
- `find_merchant_types`
- `find_deals`
- `find_deal_types`
- `find_countries`


### Configuration Options

- `api_url` sets the API base url.  Default: http://catalog.viglink.com
- `api_key` should be set to your campaign API key.  Default: nil
- `api_key` can be set to your campaign API secret key.  Default: nil
- `api_full_response`  Determines if the searches return the full response hashes or only the segment of the response related to the request.  Default: true
- `api_cuid_url` sets the CUID API base url.  Default: https://www.viglink.com/service/v1/cuidRevenue


-----

## CUID Payment API

Please refer to the [Viglink CUID API documentation](http://support.viglink.com/entries/22235658-viglink-developer-guide) (the section on "Advanced Revenue Tracking") for additional information.

### Usage

The defaults for this segment of the API default to the general ViglinkApi configuration

```ruby
viglink = ViglinkApi::Purchases.new
```

Or for a one-off call independent from the ViglinkApi configuration (please see below for more configuration options):

```ruby
viglink = ViglinkApi::Purchases.new({:api_secret => "your_secret_key", :period => "week"})
```

### Methods

- `find_purchases` performs a search and accepts an options hash with the following keys:
	- `last_date` sets the start date for search.  Format: YYYY/MM/DD ("%Y/%m/%d").  Default: 1 day ago.
	- `period` determines the search period.  Options: day, week, month.  Default: day

### Options

- `api_secret` should be set to your Viglink API secret key.  Default: nil
- `api_cuid_url` = options[:api_cuid_url] || ViglinkApi.api_cuid_url
- `last_date` sets the start date for search.  Format: YYYY/MM/DD ("%Y/%m/%d").  Default: 1 day ago.
- `period` determines the search period.  Options: day, week, month.  Default: day


-----

## Contributing

Contributions welcome!

- We need more tests, and the existing ones need updating
- More documentation and code commenting
- Debugging and exception handling
- Features!

In traditional GitHub style:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

