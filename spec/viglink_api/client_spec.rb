# encoding: utf-8
require 'spec_helper'

describe Viglink::Client do

  it "creates a Faraday::Connection" do
    client = Viglink::Client.new
    client.connection.should be_kind_of Faraday::Connection
  end

end
