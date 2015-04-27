class TweetsWorker
  include Sidekiq::Worker

  def perform(twitter_name)
    tweets = $twitter.user_timeline("#{twitter_name}")
    tweets.each do |tweet|
      FetchTweet.create!(text: tweet.text, twitter_id: tweet.id, name: twitter_name)
    ***REMOVED***
  ***REMOVED***



  def collect_with_max_id(collection=[], max_id=nil, &block)
    response = yield(max_id)
    collection += response
    response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  ***REMOVED***

  def $twitter.get_all_tweets(user)
    collect_with_max_id do |max_id|
      options = {count: 200, include_rts: true}
      options[:max_id] = max_id unless max_id.nil?
      user_timeline(user, options)
    ***REMOVED***
  ***REMOVED***
***REMOVED***
