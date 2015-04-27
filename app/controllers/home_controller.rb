class HomeController < ApplicationController
  def index
    if params[:tweet_text]
      unless params[:tweet_text].blank?
        $twitter.update(params[:tweet_text])
        flash[:notice] ='Great, user gushulo successful tweet'
      else
        flash[:notice] = 'Please write tweet text'
      ***REMOVED***
    ***REMOVED***
  ***REMOVED***

  def tweets
    unless params[:nickname].blank?
      @nickname = params[:nickname]
    else
      redirect_to root_path, notice: 'Please set twitter name'
    ***REMOVED***

    if check_twitter_name(@nickname)
      TweetsWorker.perform_async(@nickname)
    else
      redirect_to root_path, notice: 'Please set correct twitter name'
    ***REMOVED***
    @tweets = FetchTweet.names(@nickname)
  ***REMOVED***


private
  def check_twitter_name(nickname)
    TwitterNameWorker.perform_async(nickname)
  ***REMOVED***
***REMOVED***
