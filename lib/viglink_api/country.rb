# encoding: utf-8

module ViglinkApi
  module Country

    ##
    # Retrieve the list of supported Countries
    #
    # @return [Hashie::Mash] Country
    def find_countries
      options = {}
      options[:key] = @api_key
      countries_response = get('/vigcatalog/countries.xml', options)
      countries_response.response if countries_response.response
    end

  end
end
