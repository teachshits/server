# encoding: utf-8
require "spec_helper"

describe ActivitiesController, "#notify_client_about_activity" do
  let(:activity_name) { :provoke }

  before do
    ResqueSpec.reset!
  end

  it "adds notifying of the client to resque queue" do
    get activity_name
    NotifyClient.should have_queued(activity_name.to_s).in(:high)
  end
end
