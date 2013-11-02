# encoding: utf-8
require 'forwardable'
require 'viglink_api/request'

module ViglinkApi
  class Purchases
    extend Forwardable

    include Request

    attr_reader :api_secret, :api_cuid_url, :last_date

    ##
    # Create a new ViglinkApi::Client object
    #
    # @params options [Hash]
    def initialize(options={})
      @api_secret = options[:api_secret] || ViglinkApi.api_secret
      @api_cuid_url = options[:api_cuid_url] || ViglinkApi.api_cuid_url
      @last_date = options[:last_date] || 1.day.ago.strftime("%Y/%m/%d")
      @period = options[:period] || "day"
    end

    ##
    # Create a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      params = {}
      @connection = Faraday.new(url: api_cuid_url, params: params, headers: default_headers, ssl: {verify:false}) do |faraday|
        faraday.use FaradayMiddleware::Mashify
        faraday.use FaradayMiddleware::ParseJson, content_type: /\bjson$/
        faraday.adapter Faraday.default_adapter
      end
    end


    def find_purchases(options={})
      options[:secret] = @api_secret
      if options.has_key?(:last_date)
        options[:lastDate] = options.delete(:last_date)
      else
        options[:lastDate] = @last_date
      end
      unless options.has_key?(:period)
        options[:period] = @period
      end
      purchases_response = get('', options)
    end


    private

    def default_headers
      headers = {
        accept: '*/*',
        content_type: 'text/json',
        user_agent: "Ruby Gem #{ViglinkApi::VERSION}"
      }
    end

  end
end
