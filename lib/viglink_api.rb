require 'faraday'
require 'faraday_middleware'
require 'viglink_api/version'
require 'viglink_api/client'
require 'viglink_api/purchases'

# directory = File.expand_path(File.dirname(__FILE__))

module ViglinkApi

  class << self
    attr_accessor :api_url, :api_key, :api_full_response

    ##
    # Configure default credentials
    #
    # @yield [ViglinkApi]
    def configure
      load_defaults
      yield self
      true
    end

    private

    def load_defaults
      self.api_url ||= 'http://catalog.viglink.com'
      self.api_full_response ||= true

      self.api_cuid_url ||= 'https://www.viglink.com/service/v1/cuidRevenue'
   end

  end

end

class String
  def to_bool
    return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end

