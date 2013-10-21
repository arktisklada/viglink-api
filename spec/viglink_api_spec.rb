# encoding: utf-8
require 'spec_helper'

describe ViglinkApi do

  let(:client) { ViglinkApi::Client.new }

  it "configures with an API_KEY" do
    pending "I'm using the actual key"
    client.api_key.should eq 'your-api-key'
  end

  it "points to the REST API URL" do
    client.api_url.should eq 'http://catalog.viglink.com'
  end

end
