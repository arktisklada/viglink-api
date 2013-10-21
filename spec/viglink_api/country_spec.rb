# encoding: utf-8
require 'spec_helper'

describe Viglink::Country do

  let(:client) { Viglink::Client.new }

  describe "#find_countries" do

    context "without search options" do

      it "returns a list of supported countries", vcr: true do
        client.find_countries.should be_kind_of Hash
      end

    end

  end

end
