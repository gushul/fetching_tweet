class TweetSaveWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(tweet)
    puts tweet['text']
    FetchTweet.create!(text: tweet['text'], twitter_id: tweet['tweet_id'], name: tweet['twitter_name'])
  ***REMOVED***
***REMOVED***
