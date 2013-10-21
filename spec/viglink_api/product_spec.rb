# encoding: utf-8
require 'spec_helper'

describe Viglink::Product do

  let(:client) { Viglink::Client.new }

  describe "#find_products" do
    context "without search options" do

      before(:each) do
        @products_response = client.find_products
      end

      it "returns a Hash of products", vcr: true do
        @products_response.should be_kind_of Hash
      end

      it "retuns the total count of products", vcr: true do
        @products_response[:count].should_not be_nil
      end

      it "retuns an Array of products", vcr: true do
        @products_response.product.should_not be_nil
      end

    end

    context "with search options" do

      before(:each) do
        @products_response = client.find_products({full: true})
      end

      it "returns a Hash of products", vcr: true do
        @products_response.should be_kind_of Hash
      end

      context "response resources of product" do
        it "returns the `results`", vcr: true do
          @products_response[:results].should_not be_nil
        end

        it "returns the `parameters`", vcr: true do
          @products_response[:parameters].should_not be_nil
        end

        it "returns an `products`", vcr: true do
          @products_response.results.products.should_not be_nil
        end
      end
    end
  end

end
