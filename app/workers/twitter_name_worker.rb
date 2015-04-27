class TwitterNameWorker
  include Sidekiq::Worker

  def perform(twitter_account_id)
    $twitter.user?("#{twitter_account_id}")
  end
end
