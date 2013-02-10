# encoding: utf-8
require "spec_helper"

describe NotifyClient, ".perform" do
  let(:provoking_activity_name) { :provoke }
  let(:aint_provoking_activity_name) { :dont_provoke }

  before do
    ResqueSpec.reset!

    stub_request(:post, ::Settings.client_receiver_url).
        with(:body => {:activity_name => provoking_activity_name.to_s}).
        to_return(:body => "Did some stuff")

    stub_request(:post, ::Settings.client_receiver_url).
        with(:body => {:activity_name => aint_provoking_activity_name.to_s}).
        to_return(:body => "")
  end


  it "notifies client about activity" do
    NotifyClient.perform(provoking_activity_name)
    WebMock.should have_requested(:post, ::Settings.client_receiver_url).
                       with(:body => {:activity_name => provoking_activity_name.to_s})

    NotifyClient.perform(aint_provoking_activity_name)
    WebMock.should have_requested(:post, ::Settings.client_receiver_url).
                       with(:body => {:activity_name => aint_provoking_activity_name.to_s})
  end

  context "when client has response" do
    it "handles response" do
      # test handling of response
    end
  end

  context "when client does NOT have response" do
    it "does NOT handle response" do
      # test not handling of response
    end
  end
end
