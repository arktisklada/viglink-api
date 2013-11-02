# encoding: utf-8

module ViglinkApi
  module Deal

    ##
    # Retrieve the list of Deals
    #
    # @param :full [Boolean] If set to true|y|yes then this will return 
    # the complete response
    #
    # @return [Hashie::Mash] Deal
    def find_deals(options={})
      full_response = options.delete(:full) if options[:full]
      options[:key] = @api_key
      deals_response = get('/vigcatalog/deals.xml', options)

      if full_response.to_s.to_bool or @api_full_response
        deals_response.response if deals_response.response
      else
        deals_response.response.results.deals if deals_response.response.results
      end
    end

    ##
    # Retrieve the list of Deal Types
    #
    # @param :full [Boolean] If set to true|y|yes then this will return 
    # the complete response
    #
    # @return [Hashie::Mash] DealType
    def find_deal_types(options = {})
      full_response = options.delete(:full) if options[:full]
      options[:key] = @api_key
      deal_types_response = get('/vigcatalog/deal_types.xml', options)

      if full_response.to_s.to_bool or @api_full_response
        deal_types_response.response if deal_types_response.response
      else
        deal_types_response.response.results.deal_types if deal_types_response.response.results
      end
    end

  end
end

=begin
Optional search parameters for find_deals

Param name         Type         Kind         Allowed Values      Default Value   Description
end_on             range        filter                                           The end on date a deal is still valid for. Pass in a single date for an exact match, or pass in a range of dates delimited with a dash '-'.
end_on_max         range        filter                                           The maximum end on date for a deal.
deal_type          selection    filter                                           The deal type ID a deal belongs to.
keyword                         query                                            A term or phrase you want to find in the deal name or description.
keyword_description             query                                            A term or phrase you want to find in the deal description.
keyword_name                    query                                            A term or phrase you want to find in the deal name.
merchant           selection    filter                                           The merchant ID of the merchant a deal belongs to.
merchant_type      selection    filter                                           The merchant type ID that a deal's merchant belongs to.
page               item         pagination   1-100                1              The page number of the results you want returned.
results_per_page   item         pagination   1-100                20             The number of deals to return in every response.
session                         session                                          Zipped info used to build more relevant filter values in the response in order to get back to previous filtered states. You do NOT to generate session value, it is provided in the parameters block. Pass it forward for any additional calls you make.
site_wide          item         filter       all, yes, no         all            Indicates whether or not a deal applies site wide on a merchant's site, as opposed to being for a specific product or specific category within the merchant's site.
sort_deal          sort                      relevance, name_asc  relevance      The sort order the deals are returned in
start_on           range        filter                                           The start on date a deal is valid for. Pass in a single date for an exact match, or pass in a range of dates delimited with a dash '-'.
start_on_max       range        filter                                           The maximum start on date for a deal.
start_on_min       range        filter                                           The minimum start on date for a deal.
=end
