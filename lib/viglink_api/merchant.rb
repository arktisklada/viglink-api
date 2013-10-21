# encoding: utf-8

module ViglinkApi
  module Merchant

    ##
    # Retrieve the list of Merchants
    #
    # @param :full [Boolean] If set to true|y|yes then this will return 
    # the complete response
    #
    # @return [Hashie::Mash] Merchant
    def find_merchants(options={})
      full_response = options.delete(:full) if options[:full]
      options[:key] = @api_key
      merchants_response = get('/vigcatalog/merchants.xml', options)

      if full_response.to_s.to_bool or @api_full_response
        merchants_response.response if merchants_response.response
      else
        merchants_response.response.results.merchants if merchants_response.response.results
      end

    end

    ##
    # Retrieve the list of MerchantTypes
    #
    # @param :full [Boolean] If set to true|y|yes then this will return 
    # the complete response
    #
    # @return [Hashie::Mash] MerchantType
    def find_merchant_types(options={})
      full_response = options.delete(:full) if options[:full]
      options[:key] = @api_key
      merchant_types_response = get('/vigcatalog/merchant_types.xml', options)

      if full_response.to_s.to_bool or @api_full_response
        merchant_types_response.response if merchant_types_response.response
      else
        merchant_types_response.response.results.merchant_types if merchant_types_response.response.results
      end
    end

  end
end
