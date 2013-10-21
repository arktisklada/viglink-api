# encoding: utf-8
require 'spec_helper'

describe Viglink::Purchases do

  it "creates a Faraday::Connection" do
    purchases = Viglink::Purchases.new
    purchases.connection.should be_kind_of Faraday::Connection
  end

  describe "#find_purchases" do

    let(:purchases) { Viglink::Purchases.new }

    context "without search options" do

      before(:each) do
        @purchases_response = purchases.find_purchases
      end

      it "returns a Hash of purchases", vcr: true do
        @purchases_response.should be_kind_of Hash
      end

      it "retuns the total count of purchases", vcr: true do
        @purchases_response[:count].should_not be_nil
      end

      it "retuns an Array of purchases", vcr: true do
        @purchases_response.product.should_not be_nil
      end

    end

    context "with search options" do

      before(:each) do
        @purchases_response = purchases.find_purchases({period: 'week'})
      end

      it "returns a Hash of purchases", vcr: true do
        @purchases_response.should be_kind_of Hash
      end

      context "response resources of product" do
        it "returns the `results`", vcr: true do
          @purchases_response[:results].should_not be_nil
        end

        it "returns the `parameters`", vcr: true do
          @purchases_response[:parameters].should_not be_nil
        end

        it "returns an `purchases`", vcr: true do
          @purchases_response.results.purchases.should_not be_nil
        end
      end
    end
  end

end
