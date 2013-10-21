# encoding: utf-8
require 'active_support/core_ext'

module ViglinkApi
  module Request

    def get(path, options)
      request(:get, path, options)
    end

    def post(path, options)
      request(:post, path, options)
    end

    def request(method, path, options)
      response = connection.send(method) do |request|
      case method
        when :get
          request.url(path, options)
        when :put, :post
          request.path = path
          request.body = options.to_xml unless options.empty?
        end
      end

      response.body
    end

  end
end
