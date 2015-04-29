class TweetsWorker
  include Sidekiq::Worker

  def perform(twitter_name)
    tweets = $twitter.get_all_tweets("#{twitter_name}")

    tweets.each do |tweet|
      tweet = { text: tweet.text, twitter_name: twitter_name, tweet_id: tweet.id }
      # tweet = tweet.to_json
      TweetSaveWorker.perform_async(tweet)
    end
  end



  def collect_with_max_id(collection=[], max_id=nil, &block)
    response = yield(max_id)
    collection += response
    response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  end

  def $twitter.get_all_tweets(user)
    collect_with_max_id do |max_id|
      options = {count: 200, include_rts: true}
      options[:max_id] = max_id unless max_id.nil?
      user_timeline(user, options)
    end
  end
end
