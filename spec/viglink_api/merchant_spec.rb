# encoding: utf-8
require 'spec_helper'

describe Viglink::Merchant do

  let(:client) { Viglink::Client.new }

  describe "#find_merchants" do
    context "without search options" do

      before(:each) do
        @merchants_response = client.find_merchants
      end

      it "returns a Hash of merchants", vcr: true do
        @merchants_response.should be_kind_of Hash
      end

      it "retuns the total count of merchants", vcr: true do
        @merchants_response[:count].should_not be_nil
      end

      it "retuns an Array of merchants", vcr: true do
        @merchants_response.merchant.should_not be_nil
      end

    end

    context "with search options" do

      before(:each) do
        @merchants_response = client.find_merchants({full: true})
      end

      it "returns a Hash of merchants", vcr: true do
        @merchants_response.should be_kind_of Hash
      end

      context "response resources of merchant" do
        it "returns the `results`", vcr: true do
          @merchants_response[:results].should_not be_nil
        end

        it "returns the `parameters`", vcr: true do
          @merchants_response[:parameters].should_not be_nil
        end

        it "returns an `merchants`", vcr: true do
          @merchants_response.results.merchants.should_not be_nil
        end
      end
    end
  end

  describe "#find_merchant_types" do

    context "without search options" do

      before(:each) do
        @merchant_types_response = client.find_merchant_types
      end

      it "returns a Hash of merchant_types", vcr: true do
        @merchant_types_response.should be_kind_of Hash
      end

      it "retuns the total count of merchant_types", vcr: true do
        @merchant_types_response[:count].should_not be_nil
      end

      it "retuns an Array of merchant_types", vcr: true do
        @merchant_types_response.merchant_type.should_not be_nil
      end

    end

    context "with search options" do

      before(:each) do
        @merchant_types_response = client.find_merchant_types({full: true})
      end

      it "returns a Hash of merchant_types", vcr: true do
        @merchant_types_response.should be_kind_of Hash
      end

      context "response resources of product" do
        it "returns the `results`", vcr: true do
          @merchant_types_response[:results].should_not be_nil
        end

        it "returns the `parameters`", vcr: true do
          @merchant_types_response[:parameters].should_not be_nil
        end

        it "returns an `merchant_types`", vcr: true do
          @merchant_types_response.results.merchant_types.should_not be_nil
        end
      end
    end
  end


end
