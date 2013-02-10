class ActivitiesController < ApplicationController
  before_filter :notify_client_about_activity

  def provoke
    # some activity that invokes request on the client
    flash[:notice] = "Client will be notified about provoking activity in a moment"
    redirect_to :root
  end

  def dont_provoke
    # some activity that doesn't invoke request on the client
    flash[:notice] = "Client will be notified about aint provoking activity in a moment"
    redirect_to :root
  end

  protected

  def notify_client_about_activity
    Resque.enqueue(NotifyClient, params[:action])
  end
end
