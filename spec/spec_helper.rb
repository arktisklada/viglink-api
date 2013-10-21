require "viglink-api"
require "vcr"
require "simplecov"
require "simplecov-rcov"

class SimpleCov::Formatter::MergedFormatter
  def format(result)
    SimpleCov::Formatter::HTMLFormatter.new.format(result)
    SimpleCov::Formatter::RcovFormatter.new.format(result)
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter
SimpleCov.start do
  add_filter '/vendor'
end

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = {record: :new_episodes}

end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true

  # Add gem specific configure for easy access
  #
  c.before(:each) do
    ViglinkApi.configure do |config|
      config.api_key = 'your-api-key'
      config.api_url = 'http://catalog.viglink.com'
      config.api_secret = 'your-secret-key'
      config.api_cuid_url = 'https://www.viglink.com/service/v1/cuidRevenue'
    end
  end
end
