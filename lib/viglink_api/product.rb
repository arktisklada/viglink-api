# encoding: utf-8

module ViglinkApi
  module Product

    ##
    # Retrieve the list of Products
    # @param :full [Boolean] If set to true|y|yes then this will return 
    # the complete response
    #
    # @return [Hashie::Mash] Product
    def find_products(options={})
      full_response = options.delete(:full) if options[:full]
      options[:key] = @api_key
      products_response = get('/vigcatalog/products.xml', options)

      if full_response.to_s.to_bool or @api_full_response
        products_response.response if products_response.response
      else
        products_response.response.results.products if products_response.response.results
      end

    end

  end
end
