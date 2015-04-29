class HomeController < ApplicationController
  def index
    if params[:tweet_text]
      unless params[:tweet_text].blank?
        $twitter.update(params[:tweet_text])
        flash[:notice] ='Great, user gushulo successful tweet'
      else
        flash[:notice] = 'Please write tweet text'
      end
    end
  end

  def tweets
    unless params[:nickname].blank?
      @nickname = params[:nickname]
    else
      redirect_to root_path, notice: 'Please set twitter name'
    end

    if $twitter.user?(@nickname)
      @tweets = FetchTweet.names(@nickname)
      @tweets = FetchTweet.fetch_all_tweets(@nickname) if @tweets.empty?
    else
      redirect_to root_path, notice: 'Please set correct twitter name'
    end

  end
end
