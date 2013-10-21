# encoding: utf-8
require 'spec_helper'

describe Viglink::Deal do

  let(:client) { Viglink::Client.new }

  describe "#find_deals" do
    context "without search options" do

      before(:each) do
        @deals_response = client.find_deals
      end

      it "returns a Hash of deals", vcr: true do
        @deals_response.should be_kind_of Hash
      end

      it "retuns the total count of deals", vcr: true do
        @deals_response[:count].should_not be_nil
      end

      it "retuns an Array of deals", vcr: true do
        @deals_response.deal.should_not be_nil
      end

    end

    context "with search options" do

      before(:each) do
        @deals_response = client.find_deals({full: true})
      end

      it "returns a Hash of deals", vcr: true do
        @deals_response.should be_kind_of Hash
      end

      context "response resources of merchant" do
        it "returns the `results`", vcr: true do
          @deals_response[:results].should_not be_nil
        end

        it "returns the `parameters`", vcr: true do
          @deals_response[:parameters].should_not be_nil
        end

        it "returns an `deals`", vcr: true do
          @deals_response.results.deals.should_not be_nil
        end
      end
    end
  end

  describe "#find_deal_types" do

    context "without search options" do

      before(:each) do
        @deal_types_response = client.find_deal_types
      end

      it "returns a Hash of deal_types", vcr: true do
        @deal_types_response.should be_kind_of Hash
      end

      it "retuns the total count of deal_types", vcr: true do
        @deal_types_response[:count].should_not be_nil
      end

      it "retuns an Array of deal_types", vcr: true do
        @deal_types_response.deal_type.should_not be_nil
      end

    end

    context "with search options" do

      before(:each) do
        @deal_types_response = client.find_deal_types({full: true})
      end

      it "returns a Hash of deal_types", vcr: true do
        @deal_types_response.should be_kind_of Hash
      end

      context "response resources of product" do
        it "returns the `results`", vcr: true do
          @deal_types_response[:results].should_not be_nil
        end

        it "returns the `parameters`", vcr: true do
          @deal_types_response[:parameters].should_not be_nil
        end

        it "returns an `deal_types`", vcr: true do
          @deal_types_response.results.deal_types.should_not be_nil
        end
      end
    end
  end


end
