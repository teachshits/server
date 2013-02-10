class NotifyClient
  @queue = :high

  def self.perform(activity_name)
    response = HTTParty.post ::Settings.client_receiver_url,
                  :body => {
                      :activity_name => activity_name
                  }
    # handle response of the client
  end
end
